import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:waste_food_management/src/core/entities/food_post_model.dart';

import '../../../../core/static_db.dart';

class FoodDetailsPage extends StatefulWidget {
  static const String routeName = '/details';
  final FoodPostModel foodPostModel;

  FoodDetailsPage({required this.foodPostModel});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  String quantityText = '1';

  void increaseQuantity() {
    setState(() {
      if (int.parse(quantityText) < widget.foodPostModel.quantity!) {
        int newQuantity = int.parse(quantityText) + 1;
        quantityText = newQuantity.toString();
      }
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (int.parse(quantityText) > 1) {
        int newQuantity = int.parse(quantityText) - 1;
        quantityText = newQuantity.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Details'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Image.network(
                  widget.foodPostModel.image ?? 'fallback_image_url',
                  height: 400,
                  width: 400,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                color: Color.fromARGB(255, 1, 14, 26),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.foodPostModel.foodName ?? 'Food Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xff1687B3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Donor Name :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              widget.foodPostModel.donnerName ?? 'Donor Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xffC06F06),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Date:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              DateFormat('yyyy-MM-dd').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          widget.foodPostModel.date!)) ??
                                  '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xffC06F06),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              DateFormat('h:mm a').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          widget.foodPostModel.date!)) ??
                                  '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 173, 192, 6),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Location :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              widget.foodPostModel.city ?? 'City Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xffC06F06),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Quantity :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              widget.foodPostModel.quantity?.toString() ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xffC06F06),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Phone Number :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              widget.foodPostModel.donnerPhoneNumber
                                      ?.toString() ??
                                  '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xffC06F06),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        currentUser != null
                            ? Row(
                                children: [
                                  Text(
                                    'Possible to serve :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      decreaseQuantity();
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffC06F06),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    quantityText,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      increaseQuantity();
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffC06F06),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Person',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Status :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              widget.foodPostModel.quantity == 0
                                  ? 'Not Available'
                                  : 'Available',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: widget.foodPostModel.quantity == 0
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: (widget.foodPostModel.quantity! > 0) &&
                                  (currentUser != null &&
                                      currentUser!.role == 'Volunteer') &&
                                  (widget.foodPostModel.division ==
                                      currentUser!.address!.division)
                              ? () {
                                  //handlePickupToDeliver();
                                  insertDataIntoDonorNotification();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Your request has been sent to the donor.'),
                                    ),
                                  );
                                }
                              : null,
                          child: Text('Request To Pickup Food Now'),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void handlePickupToDeliver() {
    int selectedQuantity = int.parse(quantityText);
    int remainingQuantity = widget.foodPostModel.quantity! - selectedQuantity;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final fieldName = 'id';
    final fieldValue = widget.foodPostModel.id;

    if (remainingQuantity >= selectedQuantity) {
      firestore
          .collection('Posts')
          .where(fieldName, isEqualTo: fieldValue)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((DocumentSnapshot doc) {
          final String itemId = doc.id;
          firestore.collection('Posts').doc(itemId).update({
            'quantity': remainingQuantity,
          });
        });
      });
    }
    setState(() {
      widget.foodPostModel.quantity = remainingQuantity;
      quantityText = '1';
    });
  }

  //Insert Data Into Firebase
  void insertDataIntoDonorNotification() {
    int selectedQuantity = int.parse(quantityText);

    final foodName = widget.foodPostModel.foodName;
    final description = widget.foodPostModel.description;
    final date = widget.foodPostModel.date.toString();
    final location = widget.foodPostModel.locationDetails;
    final quantity = selectedQuantity;
    final donorId = widget.foodPostModel.id;
    final image = widget.foodPostModel.image;
    final donorName = widget.foodPostModel.donnerName;
    final city = widget.foodPostModel.city;
    final donnerPhoneNumber = widget.foodPostModel.donnerPhoneNumber;
    final postId = widget.foodPostModel.postId;
    final volunteerPhoneNumber = currentUser!.phone;
    final volunteerName = currentUser!.name;
    final currentUserUID = FirebaseAuth.instance.currentUser!.uid;

    // Insert the details into Firestore collection
    FirebaseFirestore.instance.collection('notifications').add({
      'foodName': foodName,
      'city': city,
      'description': description,
      'date': date,
      'location': location,
      'quantity': quantity,
      'donorId': donorId,
      'image': image,
      'donorName': donorName,
      'volunteerPhoneNumber': volunteerPhoneNumber,
      'volunteerName': volunteerName,
      'donnerPhoneNumber': donnerPhoneNumber,
      'status': 'Pending',
      'volunteerId': currentUserUID,
      'postId': postId,
    }).then((value) {
      // Successfully inserted the data
      print('Data inserted into Firestore');
    }).catchError((error) {
      // Error occurred while inserting the data
      print('Error inserting data: $error');
    });
  }
}
