import 'package:flutter/material.dart';
import 'package:waste_food_management/src/features/home/presentation/screens/about_screen/about_screen.dart';
import 'package:waste_food_management/src/features/home/presentation/screens/contact_screen/contact_screen.dart';
import 'package:waste_food_management/src/features/home/presentation/screens/user_rules_screen/user_rules_screen.dart';

import '../../../../../core/utils/constant.dart';
import 'components/home_page_slider.dart';
import 'components/our_mission_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HomePageSlider(),
          const SizedBox(
            height: 20,
          ),
          Text(
            'O U R   M I S S I O N',
            style: TextStyle(
              color: titleColor,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const HomePageOurMissionCard(),
          const SizedBox(
            height: 20,
          ),
          AboutScreen(),
          const SizedBox(
            height: 20,
          ),
          UserRulesScreen(),
          const SizedBox(
            height: 20,
          ),
          ContactScreen(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
