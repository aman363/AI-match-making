
import 'package:flutter/material.dart';
import 'package:flutterapp/reusable_widgets/reusable_widgets.dart';
import 'package:flutterapp/screens/signup_screen.dart';
import 'package:flutterapp/utils/color_utils.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController= TextEditingController();
  TextEditingController _emailTextController= TextEditingController();
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
              padding:EdgeInsets.fromLTRB(
                20,MediaQuery.of(context).size.height*0.2,20,0),
              child:Column(
                children: <Widget>[
                  logoWidget("assets/images/logo1.jpg"),
                  SizedBox(
                    height:30,
                  ),
                  reusableTextField("Enter Email Address", Icons.person_outline, false, _emailTextController),
                SizedBox(
                height:20,
          ),
                  reusableTextField("Enter Password", Icons.person_outline, false, _passwordTextController),
                  SizedBox(
                    height: 20,
                  ),
              firebaseUIButton(context, "Login", (){}),
              signUpOption()
                ],
              ),
            ),
          ),
        ),);
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
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

}
