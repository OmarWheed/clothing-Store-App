import 'package:clothing_store/core/service/db_service.dart';

class FirebaseStoreService implements DbService {
  @override
  Future<void> addData(data, {String? id}) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Future getAllData() {
    throw UnimplementedError();
  }

  @override
  Future getDataById(String id) {
    throw UnimplementedError();
  }
}
