import 'package:firebase_auth/firebase_auth.dart';

/// Centralized Firebase Error Handler for Auth and Firestore
class FirebaseErrorHandler {
  /// Handle Firebase Auth and Firestore Exceptions
  static CustomError handleError(Exception e) {
    if (e is FirebaseAuthException) {
      return _handleAuthError(e);
    } else if (e is FirebaseException) {
      return _handleFirestoreError(e);
    } else {
      return CustomError(
        'An unexpected error occurred. Please try again.',
        errorCode: 'unknown',
      );
    }
  }

  /// Handle Firebase Auth Errors
  static CustomError _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      // Sign In Errors
      case 'user-not-found':
        return AuthError(
          'No account found with this email. Please check your email or create a new account.',
          errorCode: e.code,
        );

      case 'wrong-password':
        return AuthError(
          'Incorrect password. Please try again or reset your password.',
          errorCode: e.code,
        );

      case 'invalid-email':
        return AuthError(
          'Invalid email address. Please enter a valid email.',
          errorCode: e.code,
        );

      case 'user-disabled':
        return AuthError(
          'This account has been disabled. Please contact support.',
          errorCode: e.code,
        );

      case 'invalid-credential':
        return AuthError(
          'Invalid credentials. Please check your email and password.',
          errorCode: e.code,
        );

      // Sign Up Errors
      case 'email-already-in-use':
        return AuthError(
          'This email is already registered. Please sign in or use a different email.',
          errorCode: e.code,
        );

      case 'weak-password':
        return AuthError(
          'Password is too weak. Please use at least 6 characters.',
          errorCode: e.code,
        );

      case 'operation-not-allowed':
        return AuthError(
          'This operation is not allowed. Please contact support.',
          errorCode: e.code,
        );

      // Password Reset Errors
      case 'invalid-action-code':
        return AuthError(
          'Invalid or expired reset code. Please request a new one.',
          errorCode: e.code,
        );

      case 'expired-action-code':
        return AuthError(
          'Reset code has expired. Please request a new one.',
          errorCode: e.code,
        );

      // Session/Token Errors
      case 'user-token-expired':
        return AuthError(
          'Your session has expired. Please sign in again.',
          errorCode: e.code,
        );

      case 'invalid-user-token':
        return AuthError(
          'Invalid session. Please sign in again.',
          errorCode: e.code,
        );

      case 'requires-recent-login':
        return AuthError(
          'This operation requires recent authentication. Please sign in again.',
          errorCode: e.code,
        );

      // Network Errors
      case 'network-request-failed':
        return NetworkError(
          'Network error. Please check your internet connection and try again.',
          errorCode: e.code,
        );

      case 'too-many-requests':
        return NetworkError(
          'Too many attempts. Please wait a moment and try again.',
          errorCode: e.code,
        );

      // Account Management
      case 'account-exists-with-different-credential':
        return AuthError(
          'An account already exists with the same email but different sign-in method.',
          errorCode: e.code,
        );

      // Phone Auth Errors
      case 'invalid-phone-number':
        return AuthError(
          'Invalid phone number. Please enter a valid number.',
          errorCode: e.code,
        );

      case 'invalid-verification-code':
        return AuthError(
          'Invalid verification code. Please try again.',
          errorCode: e.code,
        );

      case 'invalid-verification-id':
        return AuthError(
          'Invalid verification ID. Please request a new code.',
          errorCode: e.code,
        );

      case 'session-expired':
        return AuthError(
          'Verification session has expired. Please request a new code.',
          errorCode: e.code,
        );

      // Provider Errors
      case 'popup-closed-by-user':
        return AuthError(
          'Sign-in popup was closed before completing. Please try again.',
          errorCode: e.code,
        );

      case 'popup-blocked':
        return AuthError(
          'Sign-in popup was blocked. Please allow popups and try again.',
          errorCode: e.code,
        );

      // Email Errors
      case 'missing-email':
        return AuthError(
          'Email is required. Please enter your email.',
          errorCode: e.code,
        );

      default:
        return AuthError(
          e.message ?? 'Authentication error: ${e.code}',
          errorCode: e.code,
        );
    }
  }

  /// Handle Firestore Errors
  static CustomError _handleFirestoreError(FirebaseException e) {
    switch (e.code) {
      // Permission Errors
      case 'permission-denied':
        return FirestoreError(
          'You do not have permission to access this data.',
          errorCode: e.code,
        );

      case 'unauthenticated':
        return AuthError(
          'You must be signed in to perform this action.',
          errorCode: e.code,
        );

      // Data Errors
      case 'not-found':
        return FirestoreError('Requested data not found.', errorCode: e.code);

      case 'already-exists':
        return FirestoreError('This data already exists.', errorCode: e.code);

      case 'failed-precondition':
        return FirestoreError(
          'Operation failed due to a precondition failure.',
          errorCode: e.code,
        );

      case 'aborted':
        return FirestoreError(
          'Operation was aborted due to a conflict. Please try again.',
          errorCode: e.code,
        );

      case 'out-of-range':
        return FirestoreError(
          'Value is out of valid range.',
          errorCode: e.code,
        );

      // Resource Errors
      case 'resource-exhausted':
        return FirestoreError(
          'Quota exceeded. Please try again later.',
          errorCode: e.code,
        );

      case 'data-loss':
        return FirestoreError(
          'Data loss occurred. Please contact support.',
          errorCode: e.code,
        );

      // System Errors
      case 'internal':
        return FirestoreError(
          'Internal server error. Please try again later.',
          errorCode: e.code,
        );

      case 'unimplemented':
        return FirestoreError(
          'This operation is not supported.',
          errorCode: e.code,
        );

      // Network Errors
      case 'unavailable':
        return NetworkError(
          'Service is currently unavailable. Please check your connection and try again.',
          errorCode: e.code,
        );

      case 'deadline-exceeded':
        return NetworkError(
          'Operation timeout. Please try again.',
          errorCode: e.code,
        );

      case 'cancelled':
        return FirestoreError('Operation was cancelled.', errorCode: e.code);

      // Validation Errors
      case 'invalid-argument':
        return FirestoreError(
          'Invalid data provided. Please check your input.',
          errorCode: e.code,
        );

      default:
        return FirestoreError(
          e.message ?? 'Firestore error: ${e.code}',
          errorCode: e.code,
        );
    }
  }

  /// Get user-friendly error message from any exception
  static String getErrorMessage(Exception e) {
    final error = handleError(e);
    return error.message ?? 'An unexpected error occurred';
  }

  /// Check if error is network related
  static bool isNetworkError(Exception e) {
    if (e is FirebaseAuthException) {
      return e.code == 'network-request-failed' ||
          e.code == 'too-many-requests';
    } else if (e is FirebaseException) {
      return e.code == 'unavailable' || e.code == 'deadline-exceeded';
    }
    return false;
  }

  /// Check if error requires re-authentication
  static bool requiresReAuth(Exception e) {
    if (e is FirebaseAuthException) {
      return e.code == 'requires-recent-login' ||
          e.code == 'user-token-expired' ||
          e.code == 'invalid-user-token';
    } else if (e is FirebaseException) {
      return e.code == 'unauthenticated';
    }
    return false;
  }

  /// Check if error is permission related
  static bool isPermissionError(Exception e) {
    if (e is FirebaseException) {
      return e.code == 'permission-denied' || e.code == 'unauthenticated';
    }
    return false;
  }
}

// ============================================
// Custom Error Classes
// ============================================

/// Base custom error class
class CustomError implements Exception {
  final String? message;
  final String? errorCode;
  final DateTime timestamp;

  CustomError(this.message, {this.errorCode}) : timestamp = DateTime.now();

  @override
  String toString() => message ?? 'Unknown Error';

  /// Convert to Map for logging
  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'errorCode': errorCode,
      'timestamp': timestamp.toIso8601String(),
      'type': runtimeType.toString(),
    };
  }
}

/// Authentication related errors
class AuthError extends CustomError {
  AuthError(super.message, {super.errorCode});
}

/// Network related errors
class NetworkError extends CustomError {
  NetworkError(super.message, {super.errorCode});
}

/// Firestore related errors
class FirestoreError extends CustomError {
  FirestoreError(super.message, {super.errorCode});
}

/// Server/Backend errors
class ServerError extends CustomError {
  ServerError(super.message, {super.errorCode});
}
