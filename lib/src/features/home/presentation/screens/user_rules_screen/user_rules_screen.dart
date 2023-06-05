import 'package:flutter/material.dart';

class UserRulesScreen extends StatefulWidget {
  const UserRulesScreen({Key? key}) : super(key: key);

  @override
  State<UserRulesScreen> createState() => _UserRulesScreenState();
}

class _UserRulesScreenState extends State<UserRulesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Users Rules',
            style: TextStyle(
              
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color(0xffFB8500),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 450,
                    color: Colors.blueGrey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                         Image.asset('assets/volunteer rules.png',height: 150,),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Account Creation Rules',
                          style: TextStyle(
                            backgroundColor: Color.fromARGB(255, 82, 44, 92),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '1. Require Donor/Volunteer to provide a valid email address during the account creation process.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '2. Phone number will varify for all to prove it belong to real user.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '3. Use real photo in profile to avoid account deactivation. It may verify via video call.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '4. House, Road , Address must be real.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '5. Rud or irelivent behavior may harm your account.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 450,
                    color: Colors.blueGrey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                         Image.asset('assets/donor rules.png',height: 150,),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rules for Donor',
                          style: TextStyle(
                            backgroundColor: Color.fromARGB(255, 82, 44, 92),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '1. Food must be ready to eat or surplus vegetables.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '2. Packeging or delivery item should well packed.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '3. Be co-operative to volunteer to reach your location.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '4. Food grade safety consideration.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '5. Spam food post complain may delete your account without warning.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
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
