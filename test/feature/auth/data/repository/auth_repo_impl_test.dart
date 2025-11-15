import 'package:clothing_store/core/error/handle_error.dart';
import 'package:clothing_store/core/error/result.dart';
import 'package:clothing_store/feature/auth/data/datasourse/remote_data_sourse.dart';
import 'package:clothing_store/feature/auth/data/repository/auth_repo_impl.dart';
import 'package:clothing_store/feature/auth/domain/entity/sign_up_entity.dart';
import 'package:clothing_store/feature/auth/domain/repository/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([RemoteDataSourse])
void main() {
  late RemoteDataSourse remoteDataSourse;
  late AuthRepo authRepo;

  setUp(() {
    remoteDataSourse = MockRemoteDataSourse();
    authRepo = AuthRepoImpl(remoteDataSourse);
  });

  group("sign In with email and password", () {
    test("test sign In with email and password sholud success", () async {
      //assert
      String tEmail = "omar@gmail.com";
      String tPassword = "omar123";

      var successResponse = Success<User>(null);
      provideDummy<Result<User>>(successResponse);
      when(
        remoteDataSourse.signInWithEmailAndPassowrd(tEmail, tPassword),
      ).thenAnswer((_) async => successResponse);
      //act
      var res =
          await authRepo.signInWithEmailAndPassowrd(tEmail, tPassword)
              as Success;

      expect(res, isA<Success>());
    });
    test(
      "test sign In with email and password sholud failure when something is wrong ",
      () async {
        //assert
        String tEmail = "omar@gmail.com";
        String tPassword = "omar123";

        var failureResponse = Failure<User>(null);
        provideDummy<Result<User>>(failureResponse);
        when(
          remoteDataSourse.signInWithEmailAndPassowrd(tEmail, tPassword),
        ).thenAnswer((_) async => failureResponse);
        //act
        var res =
            await authRepo.signInWithEmailAndPassowrd(tEmail, tPassword)
                as Failure;

        expect(res, isA<Failure>());
      },
    );
  });
  group("signUp with email and password", () {
    test(
      "test signUp with email and password when all is correct should return Success",
      () async {
        //arrange
        SignUpEntity tEntity = SignUpEntity(email: "Omar@gmail.com");
        var sucessResponse = Success<UserCredential>(null);
        provideDummy<Result<UserCredential>>(sucessResponse);
        when(
          remoteDataSourse.signUp(tEntity.toModel()),
        ).thenAnswer((_) async => sucessResponse);
        // act
        var res = await authRepo.signUp(tEntity) as Success;
        //assert
        expect(res, isA<Success>());
      },
    );
    test(
      "test signUp with email and password when all is correct should return Failure",
      () async {
        //arrange
        SignUpEntity tEntity = SignUpEntity(email: "Omar@gmail.com");
        var failureResponse = Failure<void>(ServerError("some error"));
        when(
          remoteDataSourse.signUp(tEntity.toModel()),
        ).thenAnswer((_) => Future.value(failureResponse));
        // act
        var res = await authRepo.signUp(tEntity) as Failure;
        //assert
        expect(res, isA<Failure>());
        expect(res.exception?.message, equals("some error"));
      },
    );
  });

  group("test signin with google", () {
    test("test signIn with google should return success", () async {
      //arrange
      var successResponse = Success<UserCredential>(null);
      provideDummy<Result<UserCredential>>(successResponse);
      when(
        remoteDataSourse.signInWithGoogle(),
      ).thenAnswer((_) async => successResponse);
      //act
      var res = await authRepo.signInWithGoogle();
      //assert
      expect(res, isA<Success>());
    });
    test(
      "test signIn with google should return failure  when something is to be wrong ",
      () async {
        //arrange
        var failureResponse = Failure<UserCredential>(
          CustomError("some error", errorCode: "500"),
        );
        provideDummy<Result<UserCredential>>(failureResponse);
        when(
          remoteDataSourse.signInWithGoogle(),
        ).thenAnswer((_) async => failureResponse);
        //act
        var res = await authRepo.signInWithGoogle();
        //assert
        expect(res, isA<Failure>());
      },
    );
  });

  group("test signIn with Facebook", () {
    test("test should be pass and return Success", () async {
      //arrange

      var successResponse = Success<UserCredential>(null);
      provideDummy<Result<UserCredential>>(successResponse);
      when(
        remoteDataSourse.signInWithFacebook(),
      ).thenAnswer((_) async => successResponse);
      //act
      var res = await authRepo.signInWithFacebook();
      //assert
      expect(res, isA<Success>());
    });
    test("test should be wrong and return failure", () async {
      //arrange

      var failureResponse = Failure<UserCredential>(
        CustomError("somse wroing"),
      );
      provideDummy<Result<UserCredential>>(failureResponse);
      when(
        remoteDataSourse.signInWithFacebook(),
      ).thenAnswer((_) async => failureResponse);
      //act
      var res = await authRepo.signInWithFacebook() as Failure;
      //assert
      expect(res, isA<Failure>());
      expect(res.exception?.message, equals("somse wroing"));
    });
  });
  group("test create account  with email and password", () {
    test("test should be pass and return Success", () async {
      //arrange
      String tEmail = "omar@gmail.com";
      String tPassword = "Password";
      var successResponse = Success<UserCredential>(null);
      provideDummy<Result<UserCredential>>(successResponse);
      when(
        remoteDataSourse.createUserWithEmailAndPassword(tEmail, tPassword),
      ).thenAnswer((_) async => successResponse);
      //act
      var res = await authRepo.createUserWithEmailAndPassword(
        tEmail,
        tPassword,
      );
      //assert
      expect(res, isA<Success>());
    });
    test("test should be wrong and return failure", () async {
      //arrange
      String tEmail = "omar@gmail.com";
      String tPassword = "Password";
      var failureResponse = Failure<UserCredential>(
        CustomError("somse wroing"),
      );
      provideDummy<Result<UserCredential>>(failureResponse);
      when(
        remoteDataSourse.createUserWithEmailAndPassword(tEmail, tPassword),
      ).thenAnswer((_) async => failureResponse);
      //act
      var res =
          await authRepo.createUserWithEmailAndPassword(tEmail, tPassword)
              as Failure;
      //assert
      expect(res, isA<Failure>());
      expect(res.exception?.message, equals("somse wroing"));
    });
  });
}
