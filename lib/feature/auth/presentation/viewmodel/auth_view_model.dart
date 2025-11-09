import 'package:clothing_store/core/error/result.dart';
import 'package:clothing_store/feature/auth/domain/entity/sign_up_entity.dart';
import 'package:clothing_store/feature/auth/domain/usecase/reset_password_usecase.dart';
import 'package:clothing_store/feature/auth/domain/usecase/sign_in_usecase.dart';
import 'package:clothing_store/feature/auth/domain/usecase/sign_in_with_facebook_usecase.dart';
import 'package:clothing_store/feature/auth/domain/usecase/sign_in_with_google_usecase.dart';
import 'package:clothing_store/feature/auth/domain/usecase/sing_up_usecase.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthViewModel extends Cubit<AuthViewModelState> {
  final SignInUseCase _signInUsecase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignInWithFacebookUseCase _signInWithFacebookUseCase;
  final SignUpUsecase _signUpUsecase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  AuthViewModel(
    this._signInUsecase,
    this._signInWithGoogleUseCase,
    this._signInWithFacebookUseCase,
    this._signUpUsecase,
    this._resetPasswordUseCase,
  ) : super(AuthViewModelState());

  void resetPassword(String email) async {
 
    emit(state.copyWith(status: AuthStates.loading));

    var res = await _resetPasswordUseCase.resetPassword(email);
    switch (res) {
      case null:
      case Success<void>():
        emit(state.copyWith(data: res, status: AuthStates.success));
      case Failure<void>():
        emit(
          state.copyWith(
            data: null,
            status: AuthStates.failure,
            errorMessage: res.exception?.message,
          ),
        );
    }
  }

  void loginWithGoogle() async {
    emit(state.copyWith(status: AuthStates.loading));
    var res = await _signInWithGoogleUseCase.signInWithGoogle();
    switch (res) {
      case Success<UserCredential>():
        emit(state.copyWith(data: res, status: AuthStates.success));
      case Failure<UserCredential>():
        emit(
          state.copyWith(
            data: null,
            status: AuthStates.failure,
            errorMessage: res.exception?.message,
          ),
        );
    }
  }

  void loginWithFacebook() async {
    emit(state.copyWith(status: AuthStates.loading));
    var res = await _signInWithFacebookUseCase.signInWithFacebook();
    switch (res) {
      case Success<UserCredential>():
        emit(state.copyWith(data: res, status: AuthStates.success));
      case Failure<UserCredential>():
        emit(
          state.copyWith(
            data: null,
            status: AuthStates.failure,
            errorMessage: res.exception?.message,
          ),
        );
    }
  }

  void login({required String email, required String password}) async {
    emit(state.copyWith(status: AuthStates.loading));
    var res = await _signInUsecase.signInWithEmailAndPassowrd(email, password);
    switch (res) {
      case Success<User>():
        emit(state.copyWith(data: res, status: AuthStates.success));
      case Failure<User>():
        emit(
          state.copyWith(
            status: AuthStates.failure,
            errorMessage: res.exception?.message,
          ),
        );
    }
  }

  void signUp(SignUpEntity entity) async {
    emit(state.copyWith(status: AuthStates.loading));
    var res = await _signUpUsecase.signUp(entity);
    switch (res) {
      case null:
      case Success<void>():
        emit(
          state.copyWith(
            data: null,
            status: AuthStates.success,
            errorMessage: null,
          ),
        );
      case Failure<void>():
        emit(
          state.copyWith(
            data: null,
            status: AuthStates.failure,
            errorMessage: res.exception?.message,
          ),
        );
    }
  }
}
