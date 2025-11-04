import 'package:firebase_auth/firebase_auth.dart';

class HandleServerErorr {
  static CustomError handleFirebaseError(Exception e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
          return ServerError("No user found for that email.");

        case 'wrong-password':
          return ServerError("Wrong password provided for that user.");

        case 'weak-password':
          return ServerError('The password provided is too weak.');
        case 'email-already-in-use':
          return ServerError('The account already exists for that email.');
      }
    } else {
      return CustomError("UnKnown Error Occured");
    }
    return CustomError("UnKnown Error Occured ===={$e}");
  }
}

class CustomError implements Exception {
  String? message;
  CustomError(this.message);
}

class ServerError extends CustomError {
  ServerError(super.message);
}
