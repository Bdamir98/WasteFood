import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waste_food_management/src/core/entities/address_model.dart';
import 'package:waste_food_management/src/core/parameters/params.dart';

import '../../../../../core/helper_widgets/show_snackbar.dart';
import '../../../../../injection/injection_container.dart';
import '../../../../home/presentation/bloc/home_bloc.dart';
import '../../../../home/presentation/pages/home_page.dart';
import '../../../../home/presentation/screens/available_food_screen/dialogs/create_post_dialog.dart';
import '../../../../home/presentation/widgets/custom_radio_button.dart';
import '../../bloc/auth_bloc.dart';
import '../../dialogs/login_dialog.dart';
import '../../dialogs/show_otp_dialog.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String role = '';
  String name = '';
  String email = '';
  String password = '';
  String phone = '';
  String city = '';
  String division = '';
  String roadNo = '';
  String houseNo = '';
  String image = '';
  String confirmPassword = '';

  String vId = '';

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final homeBloc = sl<HomeBloc>();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: mq.width * 0.5,
                      height: mq.height * 0.5,
                      child: Image.asset(
                        'assets/FoodGarden.png',
                      ),
                    ),
                    MaterialButton(
                      color: Colors.blue,
                      child: const Text('Log In',style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        loginDialog(
                          context,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(mq.width * 0.02),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) async {
                              if (state is RegistrationSuccessState ||
                                  state is LoginSuccessState) {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    HomePage.routeName, (route) => false);
                              }

                              if (state is SendOtpState) {
                                showOtpDialog(
                                    context, state.confirmationResult);
                              }

                              if (state is VerifiedPhoneNumberState) {
                                context.read<AuthBloc>().add(
                                      RegistrationEvent(
                                        params: RegistrationParams(
                                          name: name,
                                          image: [image],
                                          address: AddressModel(
                                            city: city,
                                            division: division,
                                            roadNo: roadNo,
                                            houseNo: houseNo,
                                          ),
                                          email: email,
                                          password: password,
                                          phone: phone,
                                          role: role,
                                        ),
                                      ),
                                    );
                              }
                            },
                            builder: (context, state) {
                              if (state is RegistrationSuccessState) {
                                // Navigator.pop(context);
                                return Text(state.message);
                              }
                              if (state is RegistrationSuccessState) {
                                return Text(state.message);
                              }
                              if (state is InvalidEmailState) {
                                return Text(state.message);
                              }
                              if (state is InvalidPasswordState) {
                                return Text(state.message);
                              }

                              return const SizedBox();
                            },
                          ),
                          Text(
                            'Registration',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Form(
                            key: _formKey,
                            child: SizedBox(
                              height: mq.height * 0.5,
                              child: ListView(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 300),
                                    child: SizedBox(
                                      width: 100,
                                      height: 150,
                                      child: BlocListener<HomeBloc, HomeState>(
                                        bloc: homeBloc,
                                        listener: (context, state) {
                                          if (state is ImageUploadSuccessState) {
                                            image = state.downloadLink;
                                            showSnackBar(context, 'Image Uploaded');
                                          }
                                  
                                          if (state is ImageUploadFailureState) {
                                            showSnackBar(context, state.message);
                                          }
                                        },
                                        child: ImageWidget(
                                          onSelectedImage: (xFile) {
                                            homeBloc.add(
                                                UploadImageEvent(xFile: xFile));
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Name*'),
                                  TextFormField(
                                    onChanged: (value) {
                                      name = value;
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'Name',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Your Name";
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Email*'),
                                  TextFormField(
                                    onChanged: (value) {
                                      email = value;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
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
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Password*'),
                                  TextFormField(
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      
                                      hintText: 'Password',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Password";
                                      } else if (!RegExp(
                                              r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$")
                                          .hasMatch(value)) {
                                        return "Please Enter Valid Password";
                                      }
                                    },
                                  ),
                                  const Text(
                                    'Minimum 8 character with uppercase, lowercase, number and special character',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Phone*'),
                                  TextFormField(
                                    onChanged: (value) {
                                      phone = value;
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
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
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('City*'),
                                  TextFormField(
                                    onChanged: (value) {
                                      city = value;
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'City',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Your City";
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Road No*'),
                                  TextFormField(
                                    onChanged: (value) {
                                      roadNo = value;
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'Road No',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Your Road No";
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('House No*'),
                                  TextFormField(
                                    onChanged: (value) {
                                      houseNo = value;
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'House No',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Your House No";
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                        labelText: 'Choose Division'),
                                    items: [
                                      'Chattagram',
                                      'Rajshahi',
                                      'Khulna',
                                      'Barisal',
                                      'Sylhet',
                                      'Dhaka',
                                      'Rangpur',
                                      'Mymensingh'
                                    ].map((String division) {
                                      return DropdownMenuItem<String>(
                                        value: division,
                                        child: Text(division),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      division = value!;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Role*',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      SizedBox(
                                        width: mq.width * 0.4,
                                        child: CustomRadioButton(
                                          onSelected: (selectedRole) {
                                            role = selectedRole;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                return state is RegistrationLoadingState
                                    ? const CircularProgressIndicator()
                                    : ElevatedButton(
                                        child: const Text('Register'),
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            //
                                            // gKey.currentState!.validate();

                                            // context.read<AuthBloc>().add(
                                            //       SendOtpEvent(
                                            //         phoneNumber: phone,
                                            //       ),
                                            //     );

                                            context.read<AuthBloc>().add(
                                                  RegistrationEvent(
                                                    params: RegistrationParams(
                                                      name: name,
                                                      image: [image],
                                                      address: AddressModel(
                                                        city: city,
                                                        division: division,
                                                        roadNo: roadNo,
                                                        houseNo: houseNo,
                                                      ),
                                                      email: email,
                                                      password: password,
                                                      phone: phone,
                                                      role: role,
                                                    ),
                                                  ),
                                                );
                                          }
                                        },
                                      );
                              },
                            ),
                          ),
                        ],
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
