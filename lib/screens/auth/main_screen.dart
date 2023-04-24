import 'package:ai_match_making_app/screens/auth/signin_screen.dart';
import 'package:ai_match_making_app/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:ai_match_making_app/reusable_widgets/reusable_widgets.dart';
import 'package:ai_match_making_app/utils/color_utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors:[
              hexStringToColor("FFFFFF"),
              hexStringToColor("FFFFFF")
            ], begin: Alignment.topCenter,end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("images/logo1.jpg"),
                firebaseUIButton(context, "Click here for New Registration", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                }),
                firebaseUIButton(context, "LogIn", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                }),
              ],


            ),
          ),
        ),
      ),
    );

  }
}
