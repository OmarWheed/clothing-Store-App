import 'package:clothing_store/core/service/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<Result<User>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Result<UserCredential>> signInWithGoogle();
  Future<Result<UserCredential>> signInWithFacebook();
  Future<Result<UserCredential>> createUserWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Result<void>?> resetPassword(String email);
}
