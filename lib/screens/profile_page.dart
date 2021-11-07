import 'package:fitness_app/service/auth_service.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: OutlinedButton(
          onPressed: () {
            AuthService().logout();
          },
          child: const Text('Выйти',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
            )
          ),
        ),
      ),
    );
  }
}
