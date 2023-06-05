import 'package:cloud_firestore/cloud_firestore.dart';

class FoodPostModel {
  FoodPostModel({
    this.id,
    this.foodName,
    this.donnerName,
    this.donnerPhoneNumber,
    this.description,
    this.quantity,
    this.placeName,
    this.locationDetails,
    this.division,
    this.city,
    this.image,
    this.date,
    this.postId,
  });

  FoodPostModel.fromJson(dynamic json) {
    id = json['id'];
    foodName = json['foodName'];
    donnerName = json['donnerName'];
    donnerPhoneNumber = json['donnerPhoneNumber'];
    description = json['description'];
    quantity = json['quantity'];
    placeName = json['placeName'];
    locationDetails = json['locationDetails'];
    division = json['division'];
    city = json['city'];
    image = json['image'];
    date = json['date'];
    postId = json['postId'];
  }

  String? id;
  String? postId;
  String? foodName;
  String? donnerName;
  String? donnerPhoneNumber;
  String? description;
  int? quantity;
  String? placeName;
  String? locationDetails;
  String? division;
  String? city;
  String? image;
  int? date;

  FoodPostModel copyWith({
    String? id,
    String? postId,
    String? foodName,
    String? donnerName,
    String? donnerPhoneNumber,
    String? description,
    int? quantity,
    String? placeName,
    String? locationDetails,
    String? division,
    String? city,
    int? date,
    String? image,
  }) =>
      FoodPostModel(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        foodName: foodName ?? this.foodName,
        donnerName: donnerName ?? this.donnerName,
        donnerPhoneNumber: donnerPhoneNumber ?? this.donnerPhoneNumber,
        description: description ?? this.description,
        quantity: quantity ?? this.quantity,
        placeName: placeName ?? this.placeName,
        locationDetails: locationDetails ?? this.locationDetails,
        division: division ?? this.division,
        city: city ?? this.city,
        image: image ?? this.image,
        date: date ?? this.date,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['postId'] = postId;
    map['foodName'] = foodName;
    map['donnerName'] = donnerName;
    map['donnerPhoneNumber'] = donnerPhoneNumber;
    map['description'] = description;
    map['quantity'] = quantity;
    map['placeName'] = placeName;
    map['locationDetails'] = locationDetails;
    map['division'] = division;
    map['city'] = city;
    map['image'] = image;
    map['date'] = date;
    return map;
  }
}
