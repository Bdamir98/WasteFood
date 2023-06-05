class AddressModel {
  AddressModel({
    this.houseNo,
    this.city,
    this.division,
    this.roadNo,
  });

  AddressModel.fromJson(dynamic json) {
    houseNo = json['houseNo'];
    city = json['city'];
    division = json['division'];
    roadNo = json['roadNo'];
  }

  String? houseNo;
  String? city;
  String? division;
  String? roadNo;

  AddressModel copyWith({
    String? houseNo,
    String? city,
    String? division,
    String? roadNo,
  }) =>
      AddressModel(
        houseNo: houseNo ?? this.houseNo,
        city: city ?? this.city,
        division: division ?? this.division,
        roadNo: roadNo ?? this.roadNo,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['houseNo'] = houseNo;
    map['city'] = city;
    map['division'] = division;
    map['roadNo'] = roadNo;
    return map;
  }
}