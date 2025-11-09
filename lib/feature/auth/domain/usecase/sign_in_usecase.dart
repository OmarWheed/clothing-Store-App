import 'package:clothing_store/core/error/result.dart';
import 'package:clothing_store/feature/auth/domain/repository/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInUseCase {
  final AuthRepo _authRepo;
  SignInUseCase(this._authRepo);

  Future<Result<User>> signInWithEmailAndPassowrd(
    String email,
    String password,
  ) => _authRepo.signInWithEmailAndPassowrd(email, password);
}
