import 'package:clothing_store/core/error/result.dart';
import 'package:clothing_store/feature/auth/domain/entity/sign_up_entity.dart';
import 'package:clothing_store/feature/auth/domain/repository/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpUsecase {
  final AuthRepo _authRepo;

  SignUpUsecase(this._authRepo);

  Future<Result<void>?> signUp(SignUpEntity userEntity) async {
    var user = await _authRepo.createUserWithEmailAndPassword(
      userEntity.email!,
      userEntity.password!,
    );
    switch (user) {
      case Success<UserCredential>():
        var userId = user.data!.user?.uid;
        userEntity.id = userId;
        return await _authRepo.signUp(userEntity);
      case Failure<UserCredential>():
        return Failure(user.exception);
    }
  }
}
