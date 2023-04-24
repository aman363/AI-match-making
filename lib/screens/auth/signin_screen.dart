
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ai_match_making_app/screens/Base/home_screen.dart';
import 'package:ai_match_making_app/reusable_widgets/reusable_widgets.dart';
import 'package:ai_match_making_app/screens/auth/signup_screen.dart';
import 'package:ai_match_making_app/screens/auth/reset_password.dart';
import 'package:ai_match_making_app/utils/color_utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.black
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Enter Login Information",
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
            padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                //
                // const SizedBox(
                //   height: 30,
                // ),

                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),

                forgetPassword(context),
                firebaseUIButton(context, "Sign In", () {



                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                      .then((value) {

                    if(!FirebaseAuth.instance.currentUser!.emailVerified){
                      const snackBar = SnackBar(
                        content: Text(
                            'Email not verified! Check your Inbox'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      FirebaseAuth.instance.signOut();
                    }
                    if(FirebaseAuth.instance.currentUser!.emailVerified){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()));
                    }
                  }).onError((error, stackTrace) {

                  });

                }),
                signUpOption()

              ],
            ),
          ),

        ),

      ),

    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ResetPassword())),
      ),
    );
  }
}