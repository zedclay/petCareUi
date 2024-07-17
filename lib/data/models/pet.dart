import 'package:petcare/core/constants/apilink_names.dart';
import 'package:petcare/data/models/user.dart';

class Pet {
  int? id;
  String? category;
  String? name;
  String? species;
  String? sex;
  String? birthDate;
  String? photo;
  String? qrCodeText;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  Pet(
      {this.id,
      this.category,
      this.name,
      this.species,
      this.sex,
      this.birthDate,
      this.photo,
      this.qrCodeText,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user});

  Pet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    name = json['name'];
    species = json['species'];
    sex = json['sex'];
    birthDate = json['birth_date'];
    photo = constructImageUrl(json['photo']);
    qrCodeText = json['qr_code_text'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['name'] = name;
    data['species'] = species;
    data['sex'] = sex;
    data['birth_date'] = birthDate;
    data['photo'] = photo;
    data['qr_code_text'] = qrCodeText;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  static String? constructImageUrl(String? url) {
    if (url == null) {
      return null;
    }
    if (url.startsWith('public/')) {
      url = url.replaceFirst('public/', '/');
    }
    return '${ApiLinkNames.serverimages}storage$url'; // Replace with your actual base URL
  }
}
