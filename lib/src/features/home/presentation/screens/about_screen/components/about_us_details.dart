import 'package:flutter/material.dart';

class AboutPageAboutUs extends StatelessWidget {
  const AboutPageAboutUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Center(
            child: Text(
              "Welcome to our food donation website, dedicated to reducing food waste and fighting hunger in Bangladesh.",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xff2D2C5C),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "We are a group of passionate individuals who believe that every person deserves access to nutritious food, regardless of their socioeconomic status. Our mission is to bridge the gap between excess food and those in need by collecting surplus food from individuals, restaurants, and events and distributing it to local communities and charities.",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff212529),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Our work is essential in Bangladesh, where more than 35% of the population lives below the poverty line, and many families struggle to put food on the table. We believe that everyone can contribute to making a positive impact, no matter how small, and that together, we can make a difference.",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff212529),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "We understand that food waste is a global problem, and Bangladesh is no exception. In addition to our food donation program, we also aim to educate and raise awareness about food waste and encourage people to take action in their own lives to reduce waste and help those in need.",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff212529),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
