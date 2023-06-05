import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waste_food_management/src/core/utils/constant.dart';
import 'package:waste_food_management/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:waste_food_management/src/features/profiles/presentation/pages/volunteer_profile.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/pages/registration/registration_page.dart';
import '../../features/home/presentation/widgets/custom_icon_button.dart';
import '../../features/home/presentation/widgets/custom_text_button.dart';
import '../../features/profiles/presentation/pages/donor_profile.dart';
import '../../injection/injection_container.dart';
import '../static_db.dart';

class AppMenu extends StatelessWidget {
  final TabController tabController;

  AppMenu({
    required this.tabController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Waste Food Management System',
            style: TextStyle(
              fontSize: 20,
              color: Colors.amberAccent
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.60,
            ),
            child: TabBar(
              controller: tabController,
              unselectedLabelColor: Colors.white54,
              labelColor: Colors.white,
              indicatorColor: Colors.red,
              tabs: const [
                Tab(
                  child: Text('Home'),
                ),
                Tab(
                  child: Text('About Us'),
                ),
                Tab(
                  child: Text('Available Food'),
                ),
                Tab(
                  child: Text('User Rules'),
                ),
                Tab(
                  child: Text('Contact Us'),
                ),
              ],
            ),
          ),
          Row(
            children: [
              // CustomIconButton(
              //   onPressed: () {
              //
              //   },
              //   icon: Icons.search,
              // ),
              currentUser != null
                  ? BlocListener<HomeBloc, HomeState>(
                      listener: (context, state) {
                        logger.e(currentUser!.role);
                        if (state is DonnerUserState) {
                          Navigator.pushNamed(context, DonorProfile.routeName);
                        }

                        if (state is VolunteerUserState) {
                          Navigator.pushNamed(
                              context, VolunteerProfile.routeName);
                        }
                      },
                      child: Row(
                        children: [
                          CustomIconButton(
                            icon: Icons.person,
                            onPressed: () {
                              context.read<HomeBloc>().add(CheckUserEvent());
                            },
                          ),
                          CustomTextButton(
                            title: 'Logout',
                            onPressed: () {
                              context.read<HomeBloc>().add(const LogoutEvent());
                            },
                          )
                        ],
                      ),
                    )
                  : CustomTextButton(
                      title: 'Registration',
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RegistrationPage.routeName);
                      },
                    ),

              // BlocBuilder<AuthBloc, AuthState>(
              //   bloc: bloc,
              //   builder: (context, state) {
              //     if (state is SuccessState) {
              //       if (auth.currentUser != null) {
              //         return CustomIconButton(
              //           icon: Icons.person,
              //           onPressed: () {},
              //         );
              //       }
              //     }
              //
              //     return CustomTextButton(
              //       title: 'Registration',
              //       onPressed: () {
              //         Navigator.pushNamed(context, RegistrationPage.routeName);
              //       },
              //     );
              //   },
              // )
            ],
          ),
        ],
      ),
    );
  }
}
