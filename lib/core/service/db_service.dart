import 'package:clothing_store/core/service/result.dart';

abstract class DbService<T> {
  Future<Result<void>?> addData({
    String? id,
    required String path,
    required T data,
  });
  Future<T?> getAllData();
  Future<T?> getDataById(String id);
  Future<void> delete(String id);
}
