// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeacherModel {
  String id;
  String name;
  String gender;
  String image;
  String address;
  String phoneNumber;
  String qualification;
  TeacherModel({
    required this.id,
    required this.name,
    required this.gender,
    this.image = "",
    this.address = "",
    required this.phoneNumber,
    this.qualification = "",
  });

  static TeacherModel empty() =>
      TeacherModel(id: "", name: "", gender: "", phoneNumber: "");

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'gender': gender,
      'image': image,
      'address': address,
      'phoneNumber': phoneNumber,
      'qualification': qualification,
    };
  }

  factory TeacherModel.fromJson(Map<String, dynamic> map) {
    return TeacherModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      gender: map['gender'] ?? "",
      image: map['image'] ?? "",
      address: map['address'] ?? "",
      phoneNumber: map['phoneNumber'] ?? "",
      qualification: map['qualification'] ?? "",
    );
  }
}
