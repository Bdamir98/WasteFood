import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:waste_food_management/src/core/static_db.dart';
import 'package:waste_food_management/src/features/profiles/presentation/pages/check_firestore.dart';
import 'package:waste_food_management/src/features/profiles/presentation/pages/forgot_password.dart';
import 'package:waste_food_management/src/features/profiles/presentation/pages/phone_verify.dart';

import '../../../../injection/injection_container.dart';

class VolunteerProfile extends StatelessWidget {
  static const String routeName = '/volunteer_profile';

  VolunteerProfile({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    User? currentUsers = FirebaseAuth.instance.currentUser;
    String? phoneNumber = currentUsers!.phoneNumber;
    final currentUserUID = sl<FirebaseAuth>().currentUser!.uid;

    final notificationQuery = FirebaseFirestore.instance
  .collection('pickupHistory')
  .where('volunteerId', isEqualTo: currentUserUID);



    final locationQuery = FirebaseFirestore.instance
  .collection('Posts')
  .where('division', isEqualTo: currentUser!.address!.division);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Volunteer Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 600,
                width: 1200,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: 600,
                        decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Opacity(
                                  opacity: 0.6,
                                  child: Container(
                                    height: 200,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            '${currentUser!.image}',scale: 1
                                          ),
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 140),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.green,
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2.8),
                                          child: CircleAvatar(
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: InkWell(
                                                onTap: () {},
                                                child: Icon(
                                                  Icons.image,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            radius: 47,
                                            backgroundColor: Colors.blue,
                                            backgroundImage: NetworkImage(
                                                '${currentUser!.image}'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 250, left: 20, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${currentUser!.name}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '${currentUser!.phone}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '${currentUser!.email}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '${currentUser!.address!.houseNo}, ${currentUser!.address!.roadNo}, ${currentUser!.address!.city}, ${currentUser!.address!.division}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                // Create a TextEditingController for each TextFormField
                                                TextEditingController
                                                    nameController =
                                                    TextEditingController(
                                                        text:
                                                            currentUser!.name);
                                                TextEditingController
                                                    phoneNumberController =
                                                    TextEditingController(
                                                        text:
                                                            currentUser!.phone);
                                                TextEditingController
                                                    emailController =
                                                    TextEditingController(
                                                        text:
                                                            currentUser!.email);

                                                return AlertDialog(
                                                  title:
                                                      Text('Edit Your Profile'),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 20,
                                                          vertical: 10),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Form(
                                                      key: _formKey,
                                                      child: Column(
                                                        children: [
                                                          TextFormField(
                                                            controller:
                                                                nameController, // Set the controller for the TextFormField
                                                            decoration:
                                                                InputDecoration(
                                                              labelText: 'Name',
                                                            ),
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return "Please Enter Your Name";
                                                              }
                                                            },
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                phoneNumberController, // Set the controller for the TextFormField
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Phone Number',
                                                            ),
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return "Please Enter Number";
                                                              } else if (!RegExp(
                                                                      r'(^(\+88)?(01){1}[3456789]{1}(\d){8})$')
                                                                  .hasMatch(
                                                                      value)) {
                                                                return "Please Enter Valid Phone Number";
                                                              }
                                                            },
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                emailController, // Set the controller for the TextFormField
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Email',
                                                            ),
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return "Please Enter Valid Your Email";
                                                              } else if (!RegExp(
                                                                      r"^[a-zA-Z0-9._%+-]+@(gmail|yahoo|hotmail)\.com$")
                                                                  .hasMatch(
                                                                      value)) {
                                                                return "Please Enter Valid Email";
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: Text('Submit'),
                                                      onPressed: () async {
                                                        if (_formKey
                                                            .currentState!
                                                            .validate()) {
                                                          // Update the current user's profile data with the new values
                                                          currentUser!.name =
                                                              nameController
                                                                  .text;
                                                          currentUser!.phone =
                                                              phoneNumberController
                                                                  .text;
                                                          currentUser!.email =
                                                              emailController
                                                                  .text;

                                                          try {
                                                            // Update the document in Firebase Firestore
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'Users')
                                                                .doc(
                                                                    currentUser!
                                                                        .id)
                                                                .update({
                                                              'name':
                                                                  currentUser!
                                                                      .name,
                                                              'phone':
                                                                  currentUser!
                                                                      .phone,
                                                              'email':
                                                                  currentUser!
                                                                      .email,
                                                            });

                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          } catch (e) {
                                                            // Handle the error
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                    'Error Updating Profile Data'),
                                                              ),
                                                            );
                                                          }
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Text('Edit Profile'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassword(),
                                          ));
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 300,
                                          color:
                                              Color.fromARGB(255, 8, 26, 107),
                                          child: Center(
                                              child: Text(
                                            'Forgot Password',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      phoneNumber == null
                                          ? InkWell(
                                              onTap: () {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      PhoneVerify(),
                                                ));
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 300,
                                                color: Color.fromARGB(
                                                    255, 216, 125, 39),
                                                child: Center(
                                                  child: Text(
                                                    'Phone Number Not Verified',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                // Handle onTap event for verified phone number
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 300,
                                                color: Colors
                                                    .green, // Change the color for verified phone number
                                                child: Center(
                                                  child: Text(
                                                    'Phone Number Verified',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .white, // Change the text color for verified phone number
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: Container(
                              height: 150,
                              width: 520,
                              decoration: BoxDecoration(
                                color: Color(0xff111920),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Location Notifications',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        height: 230,
                                        child: FirestoreListView<
                                            Map<String, dynamic>>(
                                          query: locationQuery,
                                          itemBuilder: (context, snapshot) {
                                            Map<String, dynamic>
                                                locationQuery =
                                                snapshot.data();
                                            return Card(
                                                color: Color(0xffF8D76D),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      width: 100,
                                                      child: Image.network(
                                                        locationQuery[
                                                            'image'],
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          locationQuery[
                                                              'foodName'],
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff113056),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(height: 2),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Donor Name :',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff113056),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Text(locationQuery[
                                                                'donnerName']),
                                                          ],
                                                        ),
                                                        SizedBox(height: 2),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Location :',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff113056),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(width: 40),
                                                            Text(locationQuery[
                                                                'locationDetails']),
                                                          ],
                                                        ),
                                                        SizedBox(height: 2),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Quantity :',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff113056),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(width: 40),
                                                            Text(
                                                              locationQuery[
                                                                      'quantity']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff4E599C),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 2),
                                                      ],
                                                    ),
                                                  ],
                                                ));
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),








                          Expanded(
                            child: Container(
                              height: 400,
                              width: 520,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: const Text(
                                        'Pickup History',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        height: 330,
                                        child:
                                            FirestoreListView<Map<String, dynamic>>(
                                          query: notificationQuery,
                                          itemBuilder: (context, snapshot) {
                                            Map<String, dynamic> user =
                                                snapshot.data();
                                            return Card(
                                                color: Color(0xffF8D76D),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      width: 100,
                                                      child: Image.network(
                                                        user['image'],
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          user['foodName'],
                                                          style: TextStyle(
                                                            color:
                                                                Color(0xff113056),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(height: 2),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Donor Name :',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff113056),
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Text(
                                                                user['donorName']),
                                                          ],
                                                        ),
                                                        SizedBox(height: 2),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Phone Number :',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff113056),
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Text(
                                                                user['donnerPhoneNumber']),
                                                          ],
                                                        ),
                                                        SizedBox(height: 2),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'City :',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff113056),
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                              ),
                                                            ),
                                                            SizedBox(width: 70),
                                                            Text(user['city']),
                                                          ],
                                                        ),
                                                        SizedBox(height: 2),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Location :',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff113056),
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                              ),
                                                            ),
                                                            SizedBox(width: 40),
                                                            Text(user[
                                                                'location']),
                                                          ],
                                                        ),
                                                        SizedBox(height: 2),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Quantity :',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff113056),
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                              ),
                                                            ),
                                                            SizedBox(width: 40),
                                                            Text(
                                                              user['quantity']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff4E599C),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ));
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
