import 'package:fitness_app/domain/user.dart';
import 'package:fitness_app/screens/auth_page.dart';
import 'package:fitness_app/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppUser? user = Provider.of<AppUser?>(context);
    final bool isLoggedIn = user != null;
    return isLoggedIn ? MainPage() : AuthorizationPage();
  }
}