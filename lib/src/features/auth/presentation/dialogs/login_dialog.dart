import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waste_food_management/src/core/parameters/params.dart';

import '../../../../injection/injection_container.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../bloc/auth_bloc.dart';

loginDialog(BuildContext context) async {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  final bloc = context.read<AuthBloc>();

  await showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text('Login'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocConsumer<AuthBloc, AuthState>(
                bloc: bloc,
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomePage.routeName, (route) => false);
                  }
                },
                builder: (context, state) {
                  if (state is LoginFailedState) {
                    return Text(state.message);
                  }
                  if (state is LoginSuccessState) {
                    return Text(state.message);
                  }
                  return const SizedBox();
                },
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
              const SizedBox(
                height: 50,
              ),
              Center(
                child: BlocBuilder<AuthBloc, AuthState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return state is LoginLoadingState
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            child: const Text('Login'),
                            onPressed: () {
                              bloc.add(
                                LoginWithEmailAndPasswordEvent(
                                  params: LoginParams(
                                    email: email,
                                    password: password,
                                  ),
                                ),
                              );
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
