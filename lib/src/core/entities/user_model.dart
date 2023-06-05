import 'package:waste_food_management/src/core/entities/address_model.dart';

class UserModel {
  UserModel({
    this.phone,
    this.role,
    this.email,
    this.name,
    this.pickedFoods,
    this.id,
    this.isApprove,
    this.image,
    this.address,
  });

  UserModel.fromJson(dynamic json) {
    phone = json['phone'];
    role = json['role'];
    email = json['email'];
    name = json['name'];
    pickedFoods =
        json['pickedFoods'] != null ? json['pickedFoods'].cast<String>() : [];
    id = json['id'];
    isApprove = json['isApprove'];
    image = json['image'] != null ? json['image'].cast<String>() : [];
    address =
        json['address'] != null ? AddressModel.fromJson(json['address']) : null;
  }

  String? phone;
  String? role;
  String? email;
  String? name;
  List<String>? pickedFoods;
  String? id;
  bool? isApprove;
  List<String>? image;
  AddressModel? address;

  UserModel copyWith({
    String? phone,
    String? role,
    String? email,
    String? name,
    List<String>? pickedFoods,
    String? id,
    bool? isApprove,
    List<String>? image,
    AddressModel? address,
  }) =>
      UserModel(
        phone: phone ?? this.phone,
        role: role ?? this.role,
        email: email ?? this.email,
        name: name ?? this.name,
        pickedFoods: pickedFoods ?? this.pickedFoods,
        id: id ?? this.id,
        isApprove: isApprove ?? this.isApprove,
        image: image ?? this.image,
        address: address ?? this.address,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['role'] = role;
    map['email'] = email;
    map['name'] = name;
    map['pickedFoods'] = pickedFoods;
    map['id'] = id;
    map['isApprove'] = isApprove;
    map['image'] = image;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    return map;
  }
}


