import 'package:ai_match_making_app/screens/auth/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ai_match_making_app/reusable_widgets/reusable_widgets.dart';
import 'package:ai_match_making_app/utils/color_utils.dart';
import 'package:flutter/material.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _psdTextController = TextEditingController();
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
          "Enter New Registration",
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
                    reusableTextField("Enter Email ID:", Icons.person_outline, false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outlined, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Confirm Password", Icons.lock_outlined, true,
                        _psdTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    firebaseUIButton(context, "Sign Up", () {
                      if(_passwordTextController.text.length<6) {
                        const snackBar = SnackBar(
                          content: Text(
                              'Password should be greater than 6 characters'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else if(_psdTextController.text!=_passwordTextController.text) {
                        const snackBar = SnackBar(
                          content: Text(
                              'Passwords do not match'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else {

                        const snackBar = SnackBar(
                          content: Text(
                              'Check your Inbox to verify the registration!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)

                            .then((value) {

                          final user = FirebaseAuth.instance.currentUser!;
                          user.sendEmailVerification();
                          FirebaseAuth.instance.signOut();
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()));


                        }).onError((error, stackTrace) {});
                      }
                    })
                  ],
                ),
              ))),
    );
  }
}