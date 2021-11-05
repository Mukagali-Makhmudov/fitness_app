import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/common/const/color_const.dart';
import 'package:fitness_app/domain/exercise.dart';
import 'package:fitness_app/screens/auth_page.dart';
import 'package:fitness_app/screens/exercises_page.dart';
import 'package:fitness_app/screens/main_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gain',
      home: AuthorizationPage(),
    );
  }
}

