// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    this.password,
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

  @override
  bool operator ==(covariant SignUpEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.password == password &&
      other.age == age &&
      other.gender == gender;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      password.hashCode ^
      age.hashCode ^
      gender.hashCode;
  }
}
