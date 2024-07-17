class User {
  String? firstName;
  String? lastName;
  String? image;
  String? token;

  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.firstName,
      this.lastName,
      this.email,
      this.updatedAt,
      this.createdAt,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    image = json['image'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    token = json['access_token'];

    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['image'] = image;
    data['access_token'] = token;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
