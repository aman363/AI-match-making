import 'package:firebase_auth/firebase_auth.dart';
import 'package:ai_match_making_app/reusable_widgets/reusable_widgets.dart';
import 'package:ai_match_making_app/utils/color_utils.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.black
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: const Text(
          "Reset Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
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
                padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Email Id", Icons.person_outline, false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    firebaseUIButton(context, "Reset Password", () {
                      if(_emailTextController.text!="") {
                        const snackBar = SnackBar(
                          content: Text(
                              'Reset Password Email Sent! Check your Inbox'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: _emailTextController.text)
                          .then((value) => Navigator.of(context).pop());
                    })
                  ],
                ),
              ))),
    );
  }
}