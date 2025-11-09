import 'package:clothing_store/feature/auth/data/models/sign_up_model.dart';

class SignUpEntity {
  String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  String? age;
  String? gender;
  SignUpEntity({
    required this.email,
    required this.password,
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.age,
  });

  SignUpModel toModel() {
    return SignUpModel(
      email: email,
      lastName: lastName,
      firstName: firstName,
      id: id,
      age: age,
      gender: gender,

    );
  }
}
