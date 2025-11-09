import 'package:clothing_store/core/service/db_service.dart';
import 'package:clothing_store/core/error/handle_error.dart';
import 'package:clothing_store/core/error/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DbService)
class FirebaseStoreService implements DbService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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

  @override
  Future<Result<void>> addData({
    String? id,
    required String path,
    required data,
  }) async {
    try {
      id != null
          ? await _firestore.collection(path).doc(id).set(data)
          : await _firestore.collection(path).add(data);

      return Success(null);
    } on Exception catch (e) {
      return Failure(FirebaseErrorHandler.handleError(e));
    }
  }
}
