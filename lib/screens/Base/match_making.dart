import 'package:ai_match_making_app/screens/Base/home_screen.dart';
import 'package:ai_match_making_app/screens/Base/my_page.dart';
import 'package:flutter/material.dart';

import '../../reusable_widgets/reusable_widgets.dart';

class Match_making extends StatefulWidget {
  const Match_making({Key? key}) : super(key: key);

  @override
  State<Match_making> createState() => _Match_makingState();
}

class _Match_makingState extends State<Match_making> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
        firebaseUIButton(context,"Schedule of Matches",(){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        })


    // )
      ),
      body: const CustomLogoWidget(
        imagePath: "assets/images/matchmaking.png",
        text: "This is where you can see your potential opponent",
      ),

    );
  }
}
