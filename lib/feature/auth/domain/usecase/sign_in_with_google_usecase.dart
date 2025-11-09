import 'package:clothing_store/core/error/result.dart';
import 'package:clothing_store/feature/auth/domain/repository/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInWithGoogleUseCase {
  final AuthRepo _authRepo;
  SignInWithGoogleUseCase(this._authRepo);

  Future<Result<UserCredential>> signInWithGoogle() =>
      _authRepo.signInWithGoogle();
}
