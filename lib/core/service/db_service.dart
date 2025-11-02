abstract class DbService<T> {
  Future<void> addData(T data, {String? id});
  Future<T?> getAllData();
  Future<T?> getDataById(String id);
  Future<void> delete(String id);
}
