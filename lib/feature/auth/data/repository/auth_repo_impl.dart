import 'package:clothing_store/core/service/result.dart';
import 'package:clothing_store/feature/auth/data/datasourse/remote_data_sourse.dart';
import 'package:clothing_store/feature/auth/domain/repository/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final RemoteDataSourse _dataSourse;
  AuthRepoImpl(this._dataSourse);
  @override
  Future<Result<User>> signInWithEmailAndPassowrd(
    String email,
    String password,
  ) => _dataSourse.signInWithEmailAndPassowrd(email, password);

  @override
  Future<Result<UserCredential>> signInWithFacebook() =>
      _dataSourse.signInWithFacebook();

  @override
  Future<Result<UserCredential>> signInWithGoogle() =>
      _dataSourse.signInWithGoogle();
}
