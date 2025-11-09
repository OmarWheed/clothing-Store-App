import 'package:clothing_store/core/error/result.dart';
import 'package:clothing_store/feature/auth/domain/repository/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInWithFacebookUseCase {
  final AuthRepo _authRepo;
  SignInWithFacebookUseCase(this._authRepo);

  Future<Result<UserCredential>> signInWithFacebook() => _authRepo.signInWithFacebook();
}
