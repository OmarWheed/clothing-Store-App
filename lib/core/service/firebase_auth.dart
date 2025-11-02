import 'dart:async';
import 'package:clothing_store/core/service/auth_service.dart';
import 'package:clothing_store/core/service/hadle_error.dart';
import 'package:clothing_store/core/service/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthService)
class FirebaseAuthService implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<Result<User>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success(credential.user);
    } on Exception catch (e) {
      return Failure(HandleServerErorr.handleFirebaseError(e));
    }
  }

  @override
  Future<Result<UserCredential>> signInWithFacebook() {
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCredential>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return Failure(CustomError('Google sign in was cancelled'));
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      if (googleAuth.accessToken == null && googleAuth.idToken == null) {
        return Failure(CustomError('Missing Google authentication tokens'));
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      return Success(userCredential);
    } on Exception catch (e) {
      return Failure(HandleServerErorr.handleFirebaseError(e));
    }
  }
}
