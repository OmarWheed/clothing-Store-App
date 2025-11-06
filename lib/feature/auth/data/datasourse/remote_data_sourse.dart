import 'package:clothing_store/core/service/result.dart';
import 'package:clothing_store/feature/auth/data/models/sign_up_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteDataSourse {
  Future<Result<User>> signInWithEmailAndPassowrd(
    String email,
    String password,
  );
  Future<Result<UserCredential>> signInWithGoogle();
  Future<Result<UserCredential>> signInWithFacebook();
  Future<Result<void>?> signUp(SignUpModel signUpModel);
  Future<Result<UserCredential>> createUserWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Result<void>?> resetPassword(String email);
}
