class UserModel {
  final String id;
  final String fullName;
  final String about;
  final String phone;
  final String imageUrl;
  final String documentUrl;

  UserModel({
    required this.id,
    required this.fullName,
    required this.about,
    required this.phone,
    required this.imageUrl,
    required this.documentUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      fullName: json['fullName'],
      about: json['about'],
      phone: json['phone'],
      imageUrl: json['image'],
      documentUrl: json['document'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fullName': fullName,
      'about': about,
      'phone': phone,
      'image': imageUrl,
      'document': documentUrl,
    };
  }
}
