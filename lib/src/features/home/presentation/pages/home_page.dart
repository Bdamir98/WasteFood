import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waste_food_management/src/core/helper_widgets/app_menu.dart';
import 'package:waste_food_management/src/core/helper_widgets/show_snackbar.dart';

import '../../../../injection/injection_container.dart';
import '../bloc/home_bloc.dart';
import '../screens/about_screen/about_screen.dart';
import '../screens/available_food_screen/available_food_screen.dart';
import '../screens/contact_screen/contact_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/user_rules_screen/user_rules_screen.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final auth = sl<FirebaseAuth>();
  late HomeBloc bloc;

  @override
  void initState() {
    bloc = context.read<HomeBloc>();
    tabController = TabController(length: 5, vsync: this);
    bloc.add(HomeInitEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeFailureState){
          showSnackBar(context, state.message);
        }

      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: AppMenu(tabController: tabController),
              ),
              Expanded(
                flex: 20,
                child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      const HomeScreen(),
                      const AboutScreen(),
                      const AvailableFoodScreen(),
                      const UserRulesScreen(),
                      ContactScreen(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
