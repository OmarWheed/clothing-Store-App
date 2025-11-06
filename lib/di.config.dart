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

import 'core/service/auth_service.dart' as _i976;
import 'core/service/db_service.dart' as _i405;
import 'core/service/firebase_auth.dart' as _i604;
import 'core/service/firebase_store.dart' as _i944;
import 'feature/auth/data/datasourse/remote_data_sourse.dart' as _i482;
import 'feature/auth/data/repository/auth_repo_impl.dart' as _i323;
import 'feature/auth/domain/repository/auth_repo.dart' as _i819;
import 'feature/auth/domain/usecase/reset_password_usecase.dart' as _i227;
import 'feature/auth/domain/usecase/sign_in_usecase.dart' as _i431;
import 'feature/auth/domain/usecase/sign_in_with_facebook_usecase.dart'
    as _i748;
import 'feature/auth/domain/usecase/sign_in_with_google_usecase.dart' as _i771;
import 'feature/auth/domain/usecase/sing_up_usecase.dart' as _i603;
import 'feature/auth/firebase/firebase_data_sourse_impl.dart' as _i48;
import 'feature/auth/presentation/viewmodel/auth_view_model.dart' as _i720;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i405.DbService<dynamic>>(() => _i944.FirebaseStoreService());
    gh.factory<_i976.AuthService>(() => _i604.FirebaseAuthService());
    gh.factory<_i482.RemoteDataSourse>(
      () => _i48.FirebaseDataSourseImpl(
        gh<_i976.AuthService>(),
        gh<_i405.DbService<dynamic>>(),
      ),
    );
    gh.factory<_i819.AuthRepo>(
      () => _i323.AuthRepoImpl(gh<_i482.RemoteDataSourse>()),
    );
    gh.factory<_i227.ResetPasswordUseCase>(
      () => _i227.ResetPasswordUseCase(gh<_i819.AuthRepo>()),
    );
    gh.factory<_i431.SignInUseCase>(
      () => _i431.SignInUseCase(gh<_i819.AuthRepo>()),
    );
    gh.factory<_i748.SignInWithFacebookUseCase>(
      () => _i748.SignInWithFacebookUseCase(gh<_i819.AuthRepo>()),
    );
    gh.factory<_i771.SignInWithGoogleUseCase>(
      () => _i771.SignInWithGoogleUseCase(gh<_i819.AuthRepo>()),
    );
    gh.factory<_i603.SignUpUsecase>(
      () => _i603.SignUpUsecase(gh<_i819.AuthRepo>()),
    );
    gh.factory<_i720.AuthViewModel>(
      () => _i720.AuthViewModel(
        gh<_i431.SignInUseCase>(),
        gh<_i771.SignInWithGoogleUseCase>(),
        gh<_i748.SignInWithFacebookUseCase>(),
        gh<_i603.SignUpUsecase>(),
        gh<_i227.ResetPasswordUseCase>(),
      ),
    );
    return this;
  }
}
