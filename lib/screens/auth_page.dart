import 'package:fitness_app/common/const/color_const.dart';
import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key? key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Widget logo(){
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child: Text('gain', style: TextStyle(color: AppColor.textWhite, fontSize: 50, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),)),
        ),
      );
    }

    Widget input(Icon icon, String hint, TextEditingController controller, bool obscure){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: AppColor.textWhite),
          decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white60),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3)
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1)
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10),
              child: IconTheme(
                data: IconThemeData(color: AppColor.textWhite),
                child: icon,
              )
            )
          ),
        ),
      );
    }

    Widget button(String text){
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: AppColor.mainBackColor,
          onSurface: AppColor.mainBackColor
        ),
        onPressed: (){},
        child: Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
      );
    }

    Widget form(String buttonState){
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: input(Icon(Icons.email), 'EMAIL', emailController, false),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: input(Icon(Icons.lock), 'PASSWORD', passwordController, true),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: button(buttonState),
            ), 
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppColor.mainBackColor,
      body: Column(
        children: <Widget>[
          logo(),
          form('LOGIN'),
        ]
      ),
    );
  }
}


