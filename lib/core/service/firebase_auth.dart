import 'package:clothing_store/core/service/auth_service.dart';
import 'package:clothing_store/core/service/hadle_error.dart';
import 'package:clothing_store/core/service/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
  Future<Result<UserCredential>> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.accessToken == null) {
        return Failure(CustomError("FaceBook sign in was cancelled"));
      }
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      if (facebookAuthCredential.idToken == null &&
          facebookAuthCredential.accessToken == null) {
        return Failure(CustomError("Missing Google authentication tokens"));
      }

      var userCredential = await FirebaseAuth.instance.signInWithCredential(
        facebookAuthCredential,
      );
      return Success(userCredential);
    } on Exception catch (e) {
      return Failure(HandleServerErorr.handleFirebaseError(e));
    }
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

  @override
  Future<Result<UserCredential>> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success(credential);
    } on Exception catch (e) {
      return Failure(HandleServerErorr.handleFirebaseError(e));
    }
  }

  @override
  Future<Result<void>?> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Success(null);
    } on Exception catch (e) {
      return Failure(HandleServerErorr.handleFirebaseError(e));
    }
  }
}
