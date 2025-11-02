import 'package:clothing_store/core/service/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteDataSourse {
  Future<Result<User>> signInWithEmailAndPassowrd(
    String email,
    String password,
  );
  Future<Result<UserCredential>> signInWithGoogle();
  Future<Result<UserCredential>> signInWithFacebook();
}
