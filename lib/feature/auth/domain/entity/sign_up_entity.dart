import 'package:clothing_store/feature/auth/data/models/sign_up_model.dart';

class SignUpEntity {
  String? id;
  String? firstName;
  String? lastName;
  final String? email;
  final String? password;

  SignUpEntity({
    required this.email,
    required this.password,
    this.id,
    this.firstName,
    this.lastName,
  });

  SignUpModel toModel() {
    return SignUpModel(
      email: email,
      lastName: lastName,
      firstName: firstName,
      id: id,
    );
  }
}
