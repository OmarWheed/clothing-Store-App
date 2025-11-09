import 'package:clothing_store/core/error/result.dart';
import 'package:clothing_store/feature/auth/domain/entity/sign_up_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Result<User>> signInWithEmailAndPassowrd(
    String email,
    String password,
  );
  Future<Result<UserCredential>> signInWithGoogle();
  Future<Result<UserCredential>> signInWithFacebook();
  Future<Result<void>?> signUp(SignUpEntity signUpEntity);
  Future<Result<UserCredential>> createUserWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Result<void>?> resetPassword(
    String email,
  );
}
