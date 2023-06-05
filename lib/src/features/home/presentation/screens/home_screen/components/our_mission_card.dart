import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/static_db.dart';


class HomePageOurMissionCard extends StatelessWidget {
  const HomePageOurMissionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          Expanded(
            child: OurMissionCardChild(
              imagePath: ourMissionList[0].image,
              heading: ourMissionList[0].heading,
              description: ourMissionList[0].description,
            ),
          ),
          Expanded(
            child: OurMissionCardChild(
              imagePath: ourMissionList[1].image,
              heading: ourMissionList[1].heading,
              description: ourMissionList[1].description,
            ),
          ),
          Expanded(
            child: OurMissionCardChild(
              imagePath: ourMissionList[2].image,
              heading: ourMissionList[2].heading,
              description: ourMissionList[2].description,
            ),
          ),
        ],
      ),
    );
  }
}


class OurMissionCardChild extends StatelessWidget {
  final String imagePath;
  final String heading;
  final String description;

  const OurMissionCardChild({
    required this.imagePath,
    required this.heading,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                child: ClipRRect(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  heading,
                  style: TextStyle(
                    color: Color(0xffFB8500),fontWeight: FontWeight.bold,fontSize: 20
                  )
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpandableText(
                  description,
                  expandText: 'show more',
                  collapseText: 'show less',
                  maxLines: 1,
                  linkColor: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
