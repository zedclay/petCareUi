class Doctor {
  String? name;
  String? clinicName;
  String? address;
  String? phoneNumber;
  String? updatedAt;
  String? createdAt;
  int? id;

  Doctor(
      {this.name,
      this.clinicName,
      this.address,
      this.phoneNumber,
      this.updatedAt,
      this.createdAt,
      this.id});

  Doctor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    clinicName = json['clinic_name'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['clinic_name'] = clinicName;
    data['address'] = address;
    data['phone_number'] = phoneNumber;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
