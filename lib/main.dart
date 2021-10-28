import 'package:fitness_app/common/const/color_const.dart';
import 'package:fitness_app/domain/exercise.dart';
import 'package:fitness_app/screens/auth_page.dart';
import 'package:fitness_app/screens/exercises_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FitnessApp());

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

