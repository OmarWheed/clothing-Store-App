// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/auth/data/datasourse/remote_data_sourse.dart' as _i692;
import '../../feature/auth/data/firebase/firebase_data_sourse_impl.dart'
    as _i908;
import '../../feature/auth/data/repository/auth_repo_impl.dart' as _i267;
import '../../feature/auth/domain/repository/auth_repo.dart' as _i534;
import '../../feature/auth/domain/usecase/reset_password_usecase.dart' as _i564;
import '../../feature/auth/domain/usecase/sign_in_usecase.dart' as _i732;
import '../../feature/auth/domain/usecase/sign_in_with_facebook_usecase.dart'
    as _i301;
import '../../feature/auth/domain/usecase/sign_in_with_google_usecase.dart'
    as _i723;
import '../../feature/auth/domain/usecase/sing_up_usecase.dart' as _i252;
import '../../feature/auth/presentation/viewmodel/auth_view_model.dart'
    as _i355;
import '../service/auth_service.dart' as _i850;
import '../service/db_service.dart' as _i467;
import '../service/firebase_auth.dart' as _i791;
import '../service/firebase_store.dart' as _i1067;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i467.DbService<dynamic>>(
      () => _i1067.FirebaseStoreService(),
    );
    gh.lazySingleton<_i850.AuthService>(() => _i791.FirebaseAuthService());
    gh.lazySingleton<_i692.RemoteDataSourse>(
      () => _i908.FirebaseDataSourseImpl(
        gh<_i850.AuthService>(),
        gh<_i467.DbService<dynamic>>(),
      ),
    );
    gh.lazySingleton<_i534.AuthRepo>(
      () => _i267.AuthRepoImpl(gh<_i692.RemoteDataSourse>()),
    );
    gh.lazySingleton<_i564.ResetPasswordUseCase>(
      () => _i564.ResetPasswordUseCase(gh<_i534.AuthRepo>()),
    );
    gh.lazySingleton<_i732.SignInUseCase>(
      () => _i732.SignInUseCase(gh<_i534.AuthRepo>()),
    );
    gh.lazySingleton<_i301.SignInWithFacebookUseCase>(
      () => _i301.SignInWithFacebookUseCase(gh<_i534.AuthRepo>()),
    );
    gh.lazySingleton<_i723.SignInWithGoogleUseCase>(
      () => _i723.SignInWithGoogleUseCase(gh<_i534.AuthRepo>()),
    );
    gh.lazySingleton<_i252.SignUpUsecase>(
      () => _i252.SignUpUsecase(gh<_i534.AuthRepo>()),
    );
    gh.factory<_i355.AuthViewModel>(
      () => _i355.AuthViewModel(
        gh<_i732.SignInUseCase>(),
        gh<_i723.SignInWithGoogleUseCase>(),
        gh<_i301.SignInWithFacebookUseCase>(),
        gh<_i252.SignUpUsecase>(),
        gh<_i564.ResetPasswordUseCase>(),
      ),
    );
    return this;
  }
}
