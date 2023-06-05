import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waste_food_management/src/core/entities/food_post_model.dart';
import 'package:waste_food_management/src/features/home/presentation/bloc/home_bloc.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/pages/registration/registration_page.dart';
import '../../features/food_details/presentation/pages/food_details_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profiles/presentation/pages/donor_profile.dart';
import '../../features/profiles/presentation/pages/volunteer_profile.dart';
import '../../injection/injection_container.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        {
          return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => sl<AuthBloc>(),
                ),
                BlocProvider(
                  create: (context) => sl<HomeBloc>(),
                ),
              ],
              child: const HomePage(),
            ),
          );
        }
      case RegistrationPage.routeName:
        {
          return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => sl<AuthBloc>(),
                ),
              ],
              child: const RegistrationPage(),
            ),
          );
        }

      case FoodDetailsPage.routeName:
        {
          final allPost = settings.arguments as FoodPostModel;
          return MaterialPageRoute(
            builder: (context) => FoodDetailsPage(foodPostModel: allPost),
          );
        }

      case DonorProfile.routeName:
        {
          return MaterialPageRoute(
            builder: (context) => DonorProfile(),
          );
        }
      case VolunteerProfile.routeName:
        {
          return MaterialPageRoute(
            builder: (context) => VolunteerProfile(),
          );
        }

      default:
        {
          return MaterialPageRoute(
            builder: (context) => const ErrorPage(),
          );
        }
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('Error'),
      ),
    );
  }
}
