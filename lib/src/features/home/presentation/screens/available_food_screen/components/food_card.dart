import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodCard extends StatelessWidget {
  final String imagePath;
  final String foodName;
  final String placeName;
  final String address;
  final String foodStatus;

  const FoodCard({
    super.key,
    required this.imagePath,
    required this.foodName,
    required this.placeName,
    required this.address,
    required this.foodStatus,
  });

  @override
  Widget build(BuildContext context) {
    Color foodStatusColor = foodStatus == 'Available' ? Colors.green : Colors.red;
    return Card(
      color: const Color(0xff282B4A), 
      margin: const EdgeInsets.only(right: 8, bottom: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(20),
              ),
              child: Image.network(
                imagePath,
                width: double.infinity,
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      foodName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFB8500),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Place Name :',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Text(
                          placeName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'House, Road, City :',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 15,),
                        Text(
                          address,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Status :',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 15,),
                        
                        Text(
                          foodStatus,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: foodStatus == 'Available' ? Colors.green : Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
