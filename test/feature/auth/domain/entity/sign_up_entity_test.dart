import 'package:clothing_store/feature/auth/data/models/sign_up_model.dart';
import 'package:clothing_store/feature/auth/domain/entity/sign_up_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("test to model fun should return signUp Model", () {
    //arrange
    SignUpEntity tEntity = SignUpEntity(
      email: "wheedomar@gmail.com",
      password: "password",
      age: "23",
      firstName: "omar",
      gender: "male",
      id: "1",
      lastName: "wheed",
    );
    SignUpModel tModel = SignUpModel(
      email: "wheedomar@gmail.com",
      age: "23",
      firstName: "omar",
      gender: "male",
      id: "1",
      lastName: "wheed",
    );
    //act
    var result = tEntity.toModel();

    //assert
    expect(result, tModel);
  });
}
