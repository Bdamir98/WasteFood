import 'entities/user_model.dart';

UserModel? currentUser;


class OurMissionModel {
  final String image;
  final String heading;
  final String description;

  OurMissionModel({
    required this.image,
    required this.heading,
    required this.description,
  });
}

List<OurMissionModel> ourMissionList = [
  OurMissionModel(
    image: 'assets/mission1.png',
    heading: 'Collecting surplus food',
    description:
        'Our mission is to collect surplus food from various sources such as Home waste, Party Surplus, Restaurants, and caterers. To provide unconditional help to the poor and needy in the society and to provide free foofd to poor and homeless needy. To feed hungry and poor on streets destitute homes, orphanages, old age homes and where there are hungry stomach.',
  ),
  OurMissionModel(
    image: 'assets/mission2.png',
    heading: 'Distributing to those in need',
    description:
        'We then distribute this food to individuals and families in our community who are struggling with food insecurity. This website is a non-profitable and non-religious organizations',
  ),
  OurMissionModel(
    image: 'assets/mission3.png',
    heading: 'Reducing food waste',
    description:
        'By collecting and redistributing surplus food, we aim to reduce food waste and contribute to a more sustainable future for our planet.',
  ),
];
