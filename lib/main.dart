import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:waste_food_management/src/core/entities/address_model.dart';
import 'package:waste_food_management/src/core/entities/user_model.dart';
import 'package:waste_food_management/src/core/routes/route_generator.dart';
import 'package:waste_food_management/src/core/utils/constant.dart';
import 'package:waste_food_management/src/injection/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCDdAmo0ihvDsba7LMjvexjxPKHyPTlkD0",
        authDomain: "waste-food-c7378.firebaseapp.com",
        projectId: "waste-food-c7378",
        storageBucket: "waste-food-c7378.appspot.com",
        messagingSenderId: "628752731955",
        appId: "1:628752731955:web:990e3470d812839be0f846"),
  );

  initInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waste Food',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: RouteGenerator.generateRoutes,
    );
  }
}
