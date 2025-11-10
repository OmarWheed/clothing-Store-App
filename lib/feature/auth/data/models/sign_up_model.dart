// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUpModel {
  String? id;
  String? firstName;
  String? lastName;
  final String? email;
  String?gender;
  String?age;

  SignUpModel({required this.email, this.id, this.firstName, this.lastName,this.gender,this.age});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      email: json['email'],
      firstName: json['fistName'],
      id: json['id'],
      lastName: json['lastName'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'id': id,
      'lastName': lastName,
      'age':age,
      'gender':gender
    };
  }

  @override
  bool operator ==(covariant SignUpModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode;
  }
}
