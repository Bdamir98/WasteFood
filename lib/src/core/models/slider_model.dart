class SlideShow {
  String title;
  String subTitle;
  String description;
  String photo;
  SlideShow({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.photo,
  });
  static List<SlideShow> slideShow() {
    return [
      SlideShow(
          title: 'Stop Hunger and provide them with food',
          subTitle: 'Donate Your Excess Food Today',
          description:
              'Join Our Mission to Reduce Food Waste and Feed Those in Need',
          photo: 'assets/images.jpg'),
      SlideShow(
          title: "Don't Let Your Food Go to Waste",
          subTitle: 'Donate to Those in Need',
          description:
              'Help Reduce Food Waste and Support Your Community Through Donations',
          photo: 'assets/landing2.jpg'),
      SlideShow(
          title: "Share Your Food, Share Your Love",
          subTitle: 'Donate to Fight Hunger',
          description:
              'Make a Difference in Your Community by Donating Your Excess Food to Those in Need',
          photo: 'assets/landing3.jpg'),
    ];
  }
}
