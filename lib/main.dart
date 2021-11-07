import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/domain/user.dart';
import 'package:fitness_app/screens/auth_page.dart';
import 'package:fitness_app/screens/landing.dart';
import 'package:fitness_app/screens/main_page.dart';
import 'package:fitness_app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthService().currentUser,
      initialData: null,
      child: MaterialApp(
        title: 'gain',
        home: LandingPage(),
      ),
    );
  }
}

