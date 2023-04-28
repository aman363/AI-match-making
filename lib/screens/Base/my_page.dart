import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ai_match_making_app/screens/auth/signin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          child: const Text("GetData"),
          onPressed: () {
            // for logout the below code works...

            // FirebaseAuth.instance.signOut().then((value) {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => const SignInScreen()));
            // });


            User? us=FirebaseAuth.instance.currentUser;
            print("UID of person:");
            print(us?.uid);

            final docRef = FirebaseFirestore.instance.collection("Teams").doc("auth_id");
            docRef.get().then(
                  (DocumentSnapshot doc) {
                final data = doc.data() as Map<String, dynamic>;
                print("Firestore Data for particular user:");
                print(data);
                print("Basic Info:");
                print(data["basicInfo"]);

              },
              onError: (e) => print("Error getting document: $e"),
            );

            FirebaseFirestore.instance.collection("Teams").doc(us?.uid).set({
              'team name': "Team 1",
              'size': 12,
            });

            FirebaseFirestore.instance.collection("Teams").where('team name', isEqualTo: "Team 1").get().then(
                  (querySnapshot) {
                print("IDs for the following query:");
                for (var docSnapshot in querySnapshot.docs) {
                  print(docSnapshot.id);
                }
              },
              onError: (e) => print("Error completing: $e"),
            );


          },
        ),

      ),



    );
  }
}
