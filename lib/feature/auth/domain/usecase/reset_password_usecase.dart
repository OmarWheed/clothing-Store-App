import 'package:clothing_store/core/service/result.dart';
import 'package:clothing_store/feature/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepo _authRepo;

  ResetPasswordUseCase(this._authRepo);

  Future<Result<void>?> resetPassword(String email) =>
      _authRepo.resetPassword(email);
}
