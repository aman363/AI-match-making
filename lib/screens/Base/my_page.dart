import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ai_match_making_app/screens/auth/signin_screen.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Logout"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()));
            });
          },
        ),

      ),



    );
  }
}
