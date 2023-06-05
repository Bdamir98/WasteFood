// ignore_for_file: public_member_api_docs, sort_constructors_first
class OurMission {
  String title;
  String description;
  String photo;
  OurMission({
    required this.title,
    required this.description,
    required this.photo,
  });
  static List<OurMission> ourMission() {
    return [
      OurMission(
          title: 'Collecting surplus food',
          description:
              'Our mission is to collect surplus food from various sources such as grocery stores, restaurants, and caterers.',
          photo: 'assets/mission1.png'),
      OurMission(
          title: 'Distributing to those in need',
          description:
              'We then distribute this food to individuals and families in our community who are struggling with food insecurity.',
          photo: 'assets/mission2.png'),
      OurMission(
          title: 'Reducing food waste',
          description:
              'By collecting and redistributing surplus food, we aim to reduce food waste and contribute to a more sustainable future for our planet.',
          photo: 'assets/mission3.png')
    ];
  }
}
