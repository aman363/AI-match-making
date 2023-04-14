import 'package:flutter/material.dart';
import 'package:flutterapp/screens/home_screen.dart';
import 'package:flutterapp/screens/verification.dart';

import '../reusable_widgets/reusable_widgets.dart';
import '../utils/color_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("FFFFFF"),
                hexStringToColor("FFFFFF")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Enter New Registration',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Email Address", Icons.person_outline, false,
                        _userNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Password", Icons.person_outline, false,
                        _passwordTextController),

                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Password Confirmation", Icons.lock_outlined, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 210,
                    ),
                    firebaseUIButton(context, "I'll send you a confirmation code", () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyVerify()));

                    })
                  ],
                ),
              ))),
    );
  }
}
