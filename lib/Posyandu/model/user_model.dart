// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  int? id;
  String name;
  String email;
  dynamic password;
  String domisili;
  UserModel({
  this.id, 
  required this.name, 
  required this.email, 
  required this.password,
  required this.domisili,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'domisili': domisili,
    };
  }

  

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name']  as String,
      email: map['email'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      domisili: map['domisili'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
