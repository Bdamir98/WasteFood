import 'package:flutter/material.dart';

Row contactCard(String title, String description, IconData conIcon) {
  return Row(
    children: [
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xff000B20),
        ),
        child: Icon(
          conIcon,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff023047),
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 54, 54, 54),
            ),
          ),
        ],
      ),
    ],
  );
}
