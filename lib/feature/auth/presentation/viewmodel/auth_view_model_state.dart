import 'package:equatable/equatable.dart';

enum AuthStates { success, failure, loading, inital }

extension CheckStatus on AuthViewModelState {
  bool get isInitial => status == AuthStates.inital;
  bool get isLoading => status == AuthStates.loading;
  bool get isSuccess => status == AuthStates.success;
  bool get isFailure => status == AuthStates.failure;
}

class AuthViewModelState<T> extends Equatable {
  final T? data;
  final String? errorMessage;
  final AuthStates status;
  const AuthViewModelState({
    this.status = AuthStates.inital,
    this.data,
    this.errorMessage,
  });
  AuthViewModelState<T> copyWith({
    AuthStates? status,
    T? data,
    String? errorMessage,
  }) {
    return AuthViewModelState<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthViewModelState<T> &&
        other.status == status &&
        other.data == data &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => Object.hash(status, data, errorMessage);

  @override
  String toString() =>
      'AuthViewModelState(status: $status, data: $data, errorMessage: $errorMessage)';

  @override
  List<Object?> get props => [data, errorMessage, status];
}
