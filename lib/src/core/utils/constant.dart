import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../models/slider_model.dart';

final logger = Logger();

const userCollectionName = 'Users';
const addressCollectionName = 'Address';
const postCollectionName = 'Posts';


Color titleColor = Color(0xffFB8500);
Color subTitleColor = Color(0xff023047);
const defaultPadding = 16.0;

Text myDescription(SlideShow slide) {
  return Text(
    slide.description,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400),
  );
}

Text mySubTitle(SlideShow slide) {
  return Text(
    slide.subTitle,
    style: TextStyle(
        fontSize: 18, color: subTitleColor, fontWeight: FontWeight.bold),
  );
}

Text myTitle(SlideShow slide) {
  return Text(
    slide.title,
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: titleColor,
    ),
  );
}
