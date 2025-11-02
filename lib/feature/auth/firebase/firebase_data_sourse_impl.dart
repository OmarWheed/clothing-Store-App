import 'package:clothing_store/core/service/auth_service.dart';
import 'package:clothing_store/core/service/result.dart';
import 'package:clothing_store/feature/auth/data/datasourse/remote_data_sourse.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteDataSourse)
class FirebaseDataSourseImpl implements RemoteDataSourse {
  final AuthService _authService;
  //final DbService _dbService;

  FirebaseDataSourseImpl(
    this._authService,

    //, this._dbService
  );

  @override
  Future<Result<User>> signInWithEmailAndPassowrd(
    String email,
    String password,
  ) => _authService.signInWithEmailAndPassword(email, password);

  @override
  Future<Result<UserCredential>> signInWithFacebook() =>
      _authService.signInWithFacebook();
  @override
  Future<Result<UserCredential>> signInWithGoogle() =>
      _authService.signInWithGoogle();
}
