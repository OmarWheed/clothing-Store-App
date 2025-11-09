import 'package:clothing_store/core/error/handle_error.dart';

sealed class Result<T> {}

class Success<T> extends Result<T> {
  T? data;
  Success(this.data);
}

class Failure<T> extends Result<T> {
  CustomError? exception;
  Failure(this.exception);
}
