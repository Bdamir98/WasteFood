import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:waste_food_management/src/core/static_db.dart';
import 'package:waste_food_management/src/core/utils/constant.dart';
import 'package:waste_food_management/src/features/profiles/presentation/pages/check_firestore.dart';
import 'package:waste_food_management/src/features/profiles/presentation/pages/forgot_password.dart';
import 'package:waste_food_management/src/features/profiles/presentation/pages/phone_verify.dart';
import 'package:waste_food_management/src/injection/injection_container.dart';

class DonorProfile extends StatelessWidget {
  static const String routeName = '/donor_profile';
  DonorProfile({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    User? currentUsers = FirebaseAuth.instance.currentUser;
    String? phoneNumber = currentUsers!.phoneNumber;
    final currentUserUID = FirebaseAuth.instance.currentUser!.uid;
    final donatesQuery = FirebaseFirestore.instance
        .collection('pickupHistory')
        .where('donorId', isEqualTo: currentUserUID);

    final notificationQuery = FirebaseFirestore.instance
        .collection('notifications')
        .where('donorId', isEqualTo: currentUserUID);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Donor Profile',
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
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 580,
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
                                    child: Image.network(currentUser!.image![0],fit: BoxFit.fill),
                                    
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
                                              '${currentUser!.image![0]}', // Make sure the URL is correct
                                            ),
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '${currentUser!.phone}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '${currentUser!.email}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '${currentUser!.address!.houseNo}, ${currentUser!.address!.roadNo},${currentUser!.address!.city}, ${currentUser!.address!.division}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
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
                                                           
                                                            print(currentUser!.id);

                                                            print(currentUser!.name);
                                                            print(currentUser!.email);
                                                            print(currentUser!.phone); print(sl<FirebaseAuth>().currentUser!.uid);

                                                             final userAc = await sl<FirebaseFirestore>()
                                                                .collection(
                                                                    userCollectionName)
                                                                .where('id', isEqualTo: currentUser!.id).get();

                                                                await sl<FirebaseFirestore>()
                                                                .collection(
                                                                    userCollectionName).doc(userAc.docs.first.id) 
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
                                                            print(sl<FirebaseAuth>().currentUser!.uid);
                                                            print(currentUser!.id);

                                                            print(currentUser!.name);
                                                            print(currentUser!.email);
                                                            print(currentUser!.phone);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          } catch (e) {
                                                            print(e);
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
                                          color: Color.fromARGB(255, 9, 4, 77),
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
                                        'Notifications',
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
                                          query: notificationQuery,
                                          itemBuilder: (context, snapshot) {
                                            Map<String, dynamic>
                                                notificationsUser =
                                                snapshot.data();
                                            return Card(
                                                color: Color(0xffF8D76D),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      width: 100,
                                                      child: Image.network(
                                                        notificationsUser[
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
                                                          notificationsUser[
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
                                                              'Volunteer Name :',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff113056),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Text(notificationsUser[
                                                                'volunteerName']),
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
                                                            Text(notificationsUser[
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
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(width: 40),
                                                            Text(
                                                              notificationsUser[
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
                                                        Row(
                                                          children: [
                                                            InkWell(
                                                              onTap: () async {
                                                                String
                                                                    volunteerId =
                                                                    notificationsUser[
                                                                        'volunteerId'];

                                                                // Assuming you're using Firebase Firestore
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'notifications')
                                                                    .where(
                                                                        'volunteerId',
                                                                        isEqualTo:
                                                                            volunteerId)
                                                                    .get()
                                                                    .then(
                                                                        (snapshot) {
                                                                  for (DocumentSnapshot doc
                                                                      in snapshot
                                                                          .docs) {
                                                                    doc.reference
                                                                        .delete();
                                                                  }
                                                                });
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .red,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                height: 30,
                                                                width: 100,
                                                                child: Center(
                                                                    child: Text(
                                                                        'Reject')),
                                                              ),
                                                            ),
                                                            SizedBox(width: 20),
                                                            // InkWell(
                                                            //   onTap: () async{
                                                            //     // Update the status in the notifications collection
                                                            //     String
                                                            //         volunteerId =
                                                            //         user[
                                                            //             'volunteerId'];
                                                            //     // Assuming you're using Firebase Firestore
                                                            //     FirebaseFirestore
                                                            //         .instance
                                                            //         .collection(
                                                            //             'notifications')
                                                            //         .where(
                                                            //             'volunteerId',
                                                            //             isEqualTo:
                                                            //                 volunteerId)
                                                            //         .get()
                                                            //         .then(
                                                            //             (snapshot) {
                                                            //       for (DocumentSnapshot doc
                                                            //           in snapshot
                                                            //               .docs) {
                                                            //         doc.reference
                                                            //             .update({
                                                            //           'status':
                                                            //               'approved'
                                                            //         });
                                                            //       }
                                                            //     });
                                                            //   },
                                                            //   child: Container(
                                                            //     decoration:
                                                            //         BoxDecoration(
                                                            //       color: Colors
                                                            //           .green,
                                                            //       borderRadius:
                                                            //           BorderRadius
                                                            //               .circular(
                                                            //                   5),
                                                            //     ),
                                                            //     height: 30,
                                                            //     width: 100,
                                                            //     child: Center(
                                                            //         child: Text(
                                                            //             'Accept')),
                                                            //   ),
                                                            // ),
                                                            InkWell(
                                                              onTap: () async {
                                                                // Update the status in the notifications collection
                                                                final volunteerId =
                                                                    notificationsUser[
                                                                        'volunteerId'];
                                                                final foodName =
                                                                    notificationsUser[
                                                                        'foodName'];
                                                                final description =
                                                                    notificationsUser[
                                                                        'description'];
                                                                final date =
                                                                    notificationsUser[
                                                                        'date'];
                                                                final location =
                                                                    notificationsUser[
                                                                        'location'];
                                                                final quantity =
                                                                    notificationsUser[
                                                                        'quantity'];
                                                                final donorId =
                                                                    notificationsUser[
                                                                        'donorId'];
                                                                final image =
                                                                    notificationsUser[
                                                                        'image'];
                                                                final donorName =
                                                                    notificationsUser[
                                                                        'donorName'];
                                                                final city =
                                                                    notificationsUser[
                                                                        'city'];
                                                                final donnerPhoneNumber =
                                                                    notificationsUser[
                                                                        'donnerPhoneNumber'];
                                                                final volunteerName =
                                                                    notificationsUser[
                                                                'volunteerName'];
                                                                Map<String,
                                                                        dynamic>
                                                                    pickupData =
                                                                    {
                                                                  'volunteerId':
                                                                      volunteerId,
                                                                  'volunteerName':
                                                                      volunteerName,
                                                                  'foodName':
                                                                      foodName,
                                                                  'description':
                                                                      description,
                                                                  'date': date,
                                                                  'donorId':
                                                                      donorId,
                                                                  'quantity':
                                                                      quantity,
                                                                  'location':
                                                                      location,
                                                                  'image':
                                                                      image,
                                                                  'donorName':
                                                                      donorName,
                                                                  'city': city,
                                                                  'donnerPhoneNumber':
                                                                      donnerPhoneNumber,
                                                                };

                                                                // Insert the data into the pickup history collection
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'pickupHistory')
                                                                    .add(
                                                                        pickupData)
                                                                    .then(
                                                                        (newDocRef) {
                                                                  print(
                                                                      'Data inserted into pickup history collection with document ID: ${newDocRef.id}');

                                                                  // Update the data from the Posts collection
                                                                  final postId =
                                                                      notificationsUser[
                                                                          'postId'];
                                                                  final quantity =
                                                                      notificationsUser[
                                                                          'quantity'];

                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          'Posts')
                                                                      .where(
                                                                          'postId',
                                                                          isEqualTo:
                                                                              postId)
                                                                      .get()
                                                                      .then((QuerySnapshot
                                                                          querySnapshot) {
                                                                    querySnapshot
                                                                        .docs
                                                                        .forEach((DocumentSnapshot
                                                                            doc) {
                                                                      final String
                                                                          postId =
                                                                          doc.id;
                                                                      final int
                                                                          postQuantity =
                                                                          doc['quantity'];
                                                                      final updatedQuantity =
                                                                          postQuantity -
                                                                              quantity;
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              'Posts')
                                                                          .doc(
                                                                              postId)
                                                                          .update({
                                                                        'quantity':
                                                                            updatedQuantity, // Replace `updatedQuantity` with the new quantity value
                                                                      }).then(
                                                                              (_) {
                                                                        // Success
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text('Quantity updated successfully'),
                                                                          ),
                                                                        );
                                                                      }).catchError(
                                                                              (error) {
                                                                        // Error updating quantity
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text('Error updating quantity'),
                                                                          ),
                                                                        );
                                                                      });
                                                                    });
                                                                  });

                                                                  // Delete the document from the notifications collection
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          'notifications')
                                                                      .where(
                                                                          'volunteerId',
                                                                          isEqualTo:
                                                                              volunteerId)
                                                                      .get()
                                                                      .then(
                                                                          (snapshot) {
                                                                    for (DocumentSnapshot doc
                                                                        in snapshot
                                                                            .docs) {
                                                                      doc.reference
                                                                          .delete();
                                                                    }
                                                                  });
                                                                }).catchError(
                                                                        (error) {
                                                                  print(
                                                                      'Error inserting data into pickup history collection: $error');
                                                                });
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .green,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                height: 30,
                                                                width: 100,
                                                                child: Center(
                                                                    child: Text(
                                                                        'Accept')),
                                                              ),
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
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 350,
                              width: 520,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Text(
                                      'Donate History',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 200,
                                      child: FirestoreListView<
                                          Map<String, dynamic>>(
                                        query: donatesQuery,
                                        itemBuilder: (context, snapshot) {
                                          Map<String, dynamic> postsUser =
                                              snapshot.data();
                                          return Card(
                                              color: Color(0xffF8D76D),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    width: 100,
                                                    child: Image.network(
                                                      postsUser['image'],
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
                                                        postsUser['foodName'],
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
                                                            'Volunteer Name :',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff113056),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text(postsUser[
                                                              'volunteerName']),
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
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          SizedBox(width: 70),
                                                          Text(postsUser[
                                                              'city']),
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
                                                          Text(postsUser[
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
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          SizedBox(width: 40),
                                                          Text(
                                                            postsUser[
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
                                                    ],
                                                  ),
                                                ],
                                              ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
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
