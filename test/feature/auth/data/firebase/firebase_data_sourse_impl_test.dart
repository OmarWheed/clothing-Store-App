// removed unused dart:async import

import 'package:clothing_store/core/error/result.dart';
import 'package:clothing_store/core/service/auth_service.dart';
import 'package:clothing_store/core/service/db_service.dart';
import 'package:clothing_store/feature/auth/data/datasourse/remote_data_sourse.dart';
import 'package:clothing_store/feature/auth/data/firebase/firebase_data_sourse_impl.dart';
import 'package:clothing_store/feature/auth/data/models/sign_up_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'firebase_data_sourse_impl_test.mocks.dart';

@GenerateMocks([AuthService, DbService])
void main() {
  late AuthService authMock;
  late DbService dbMock;
  late RemoteDataSourse remoteDataSourse;
  setUp(() {
    authMock = MockAuthService();
    dbMock = MockDbService();
    remoteDataSourse = FirebaseDataSourseImpl(authMock, dbMock);
  });

  test("test sign in with email and password sholud success", () async {
    //assert
    String tEmail = "omar@gmail.com";
    String tPassword = "Omar123";
    provideDummy<Result<User>>(Success<User>(null));
    when(
      authMock.signInWithEmailAndPassword(tEmail, tPassword),
    ).thenAnswer((_) async => Success<User>(null));
    //act
    var result =
        await remoteDataSourse.signInWithEmailAndPassowrd(tEmail, tPassword)
            as Success;

    // assert
    expect(result, isA<Success>());
  });
  test("test sign in with email and password should failure", () async {
    //assert
    String tEmail = "omar@gmail.com";
    String tPassword = "Omar123";
    var failureResponse = Failure<User>(null);
    provideDummy<Result<User>>(failureResponse);
    when(
      authMock.signInWithEmailAndPassword(tEmail, tPassword),
    ).thenAnswer((_) async => failureResponse);
    //act
    var result =
        await remoteDataSourse.signInWithEmailAndPassowrd(tEmail, tPassword)
            as Failure;

    // assert
    expect(result, isA<Failure>());
  });
  test("test signIn with google should return Success", () async {
    //arrange
    var successResponse = Success<UserCredential>(null);
    provideDummy<Result<UserCredential>>(successResponse);
    when(
      authMock.signInWithGoogle(),
    ).thenAnswer((_) async => Future.value(successResponse));
    //act
    var res = await remoteDataSourse.signInWithGoogle() as Success;
    expect(res, isA<Success>());
  });
  test(
    "test signin with google when something is wrong  sholud return failure ",
    () async {
      //arrage
      var failureResponse = Failure<UserCredential>(null);
      provideDummy<Result<UserCredential>>(failureResponse);
      when(
        authMock.signInWithGoogle(),
      ).thenAnswer((_) => Future.value(failureResponse));
      //act
      var res = await remoteDataSourse.signInWithGoogle() as Failure;
      expect(res, isA<Failure>());
    },
  );
  test(
    "test signIn with facebook when go currect should return success",
    () async {
      var successResponse = Success<UserCredential>(null);
      provideDummy<Result<UserCredential>>(successResponse);
      when(
        authMock.signInWithFacebook(),
      ).thenAnswer((_) => Future.value(successResponse));
      //act
      var res = await remoteDataSourse.signInWithFacebook() as Success;

      //assert
      expect(res, isA<Success>());
    },
  );
  test(
    "test signIn with facebook when someThing is wrong  should return Failure",
    () async {
      var failureResponse = Failure<UserCredential>(null);
      provideDummy<Result<UserCredential>>(failureResponse);
      when(
        authMock.signInWithFacebook(),
      ).thenAnswer((_) => Future.value(failureResponse));
      //act
      var res = await remoteDataSourse.signInWithFacebook() as Failure;

      //assert
      expect(res, isA<Failure>());
    },
  );

  test("test signUp should return success", () async {
    // arrange
    SignUpModel tModel = SignUpModel(email: "omar@gmail.com");
    String tPath = "user";
    var successResponse = Success<void>(null);
    provideDummy<Result<void>?>(successResponse);

    when(
      dbMock.addData(path: tPath, data: tModel.toJson()),
    ).thenAnswer((_) => Future.value(successResponse));

    //act
    var res = await remoteDataSourse.signUp(tModel) as Success;

    //assert
    expect(res, isA<Success>());
  });

  test(
    "test signUp when is something is wroong shoud return failure ",
    () async {
      // arrage
      SignUpModel tModel = SignUpModel(email: "omar@gmail.com");
      String tPath = "user";
      var failureResponse = Failure<void>(null);
      provideDummy<Result<void>?>(failureResponse);
      when(dbMock.addData(path: tPath, data: tModel.toJson())).thenAnswer((_) {
        return Future.value(failureResponse);
      });
      //act
      var res = await remoteDataSourse.signUp(tModel) as Failure;
      expect(res, isA<Failure>());
    },
  );

  test(
    "test create user with email and password when call should return Success",
    () async {
      //arrange
      var tEmail = "omar@gmail.com";
      var tPassword = "Omar123";

      var successResponse = Success<UserCredential>(null);
      provideDummy<Result<UserCredential>>(successResponse);
      when(
        authMock.createUserWithEmailAndPassword(tEmail, tPassword),
      ).thenAnswer((_) => Future.value(successResponse));
      //act
      var res =
          await remoteDataSourse.createUserWithEmailAndPassword(
                tEmail,
                tPassword,
              )
              as Success<UserCredential>;
      //assert
      expect(res, isA<Success>());
    },
  );
  test(
    "test create user with email and password when something is wrong  call should return failure",
    () async {
      //arrange
      var tEmail = "omar@gmail.com";
      var tPassword = "Omar123";

      var failureResponse = Failure<UserCredential>(null);
      provideDummy<Result<UserCredential>>(failureResponse);
      when(
        authMock.createUserWithEmailAndPassword(tEmail, tPassword),
      ).thenAnswer((_) => Future.value(failureResponse));
      //act
      var res =
          await remoteDataSourse.createUserWithEmailAndPassword(
                tEmail,
                tPassword,
              )
              as Failure;
      //assert
      expect(res, isA<Failure>());
    },
  );

  test("when test reset password should return success", () async {
    //arrange
    String tEmail = "Omar@gamil.com";
    var successResponse = Success<void>(null);
    provideDummy<Result<void>?>(successResponse);
    when(
      authMock.resetPassword(tEmail),
    ).thenAnswer((_) async => successResponse);
    //act
    var res = await remoteDataSourse.resetPassword(tEmail) as Success;

    //assert
    expect(res, isA<Success>());
  });
  test("when test reset password should return success", () async {
    //arrange
    String tEmail = "Omar@gamil.com";
    var failureResponse = Failure<void>(null);
    provideDummy<Result<void>?>(failureResponse);
    when(
      authMock.resetPassword(tEmail),
    ).thenAnswer((_) async => failureResponse);
    //act
    var res = await remoteDataSourse.resetPassword(tEmail) as Failure;

    //assert
    expect(res, isA<Failure>());
  });
}
