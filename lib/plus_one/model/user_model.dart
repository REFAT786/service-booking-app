import 'dart:io';

class UserModel {
  final String id;
  final String fullName;
  final String? about;
  final String phone;
  final String gender;
  final String image;
  final String document;

  UserModel({
    required this.id,
    required this.fullName,
    this.about,
    required this.phone,
    required this.gender,
    required this.image,
    required this.document,
  });

  // Factory constructor to parse JSON into a ProfileModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      fullName: json['fullName'],
      about: json['about'],
      phone: json['phone'],
      gender: json['gender'],
      image: json['image'],
      document: json['document'],
    );
  }

  // Convert the ProfileModel into a JSON map
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'about': about,
      'phone': phone,
      'gender': gender,
      'image': image,
      'document': document,
    };
  }


}
