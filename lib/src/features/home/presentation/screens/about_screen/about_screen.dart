import 'package:flutter/material.dart';

import '../home_screen/components/our_mission_card.dart';
import 'components/about_us_details.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Center(
          child: Text(
            'About Us',
            style: TextStyle(
              
              fontWeight: FontWeight.bold,
              fontSize: 30,
             color: Color(0xffFB8500),
            ),
          ),
        ),SizedBox(height: 20,),
        Row(
          children: [
            Expanded(child:  Image.asset('assets/about-us-page.png',height: 300,),),
            Expanded(child: Column(
              children: [
                Text(
                  "Welcome to our food donation website, dedicated to reducing food waste and fighting hunger in Bangladesh.We are a group of passionate individuals who believe that every person deserves access to nutritious food, regardless of their socioeconomicstatus. Our mission is to bridge the gap between excess food and those in need bycollecting surplus food from individuals, restaurants, and events and distributingit to local communities and charities.",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff2D2C5C),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Our work is essential in Bangladesh, where more than 35% of the population lives below the poverty line, and many families struggle to put food on the table. We believe that everyone can contribute to making a positive impact, no matter how small, and that together, we can make a difference.",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff2D2C5C),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "We understand that food waste is a global problem, and Bangladesh is no exception.In addition to our food donation program, we also aim to educate and raise awareness about food waste and encourage people to take action in their own lives to reduce waste and help those in need.",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xff2D2C5C),
                  ),
                ),
              ],
            ),),
           
            
          ],
        ),
      ],
    );
  }
}
