import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/contact_card.dart';
import 'components/text_field_widget.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController msgController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User? currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'Contact Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xffFB8500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 550,
                  color: const Color.fromARGB(209, 241, 240, 240),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Get in Touch With Us',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 1, 7, 59),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'If you have any questions about our food donation program, or if you would like to \nget involved, please Contact with us.We look forward to hearing from you and \nworking together to fight hunger in our community.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 31, 1, 34),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        contactCard('Our Location',
                            '51 Siddheswari Rd, Dhaka 1217', Icons.location_on),
                        const SizedBox(
                          height: 30,
                        ),
                        contactCard(
                            'Phone Number', '(+880)01685329107', Icons.phone),
                        const SizedBox(
                          height: 30,
                        ),
                        contactCard('Email', 'shakur.pranto2018@gmail.com',
                            Icons.email),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 550,
                  color: const Color.fromARGB(209, 241, 240, 240),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 50, top: 10, right: 50),
                    child: Container(
                      width: 100,
                      color: Color.fromARGB(255, 217, 218, 219),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: Icon(Icons.person),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Your Name";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Valid Your Email";
                                  } else if (!RegExp(
                                          r"^[a-zA-Z0-9._%+-]+@(gmail|yahoo|hotmail)\.com$")
                                      .hasMatch(value)) {
                                    return "Please Enter Valid Email";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  hintText: 'Phone',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Number";
                                  } else if (!RegExp(
                                          r'(^(\+88)?(01){1}[3456789]{1}(\d){8})$')
                                      .hasMatch(value)) {
                                    return "Please Enter Valid Phone Number";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: msgController,
                                maxLines: 5,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Write your text here',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Your Message";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Current user is found, proceed to save data
                                    FirebaseFirestore.instance
                                        .collection('user_message')
                                        .add({
                                      'name': nameController.text,
                                      'phone': phoneController.text,
                                      'email': emailController.text,
                                      'text': msgController.text,
                                    }).then((value) {
                                      // Data saved successfully
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Message Send successfully')),
                                      );
                                    }).catchError((error) {
                                      // Error occurred while saving data
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'An error occurred while saving data')),
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 241, 190, 3),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 40,
                                  width: 100,
                                  child: Center(child: Text('Submit')),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
