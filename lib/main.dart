import 'package:ai_match_making_app/screens/Base/home_screen.dart';
import 'package:ai_match_making_app/screens/auth/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'firebase_options.dart';?
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: const FirebaseOptions( apiKey: "AIzaSyAAbT7oeiCl3h5wXnKJqpr83yirMPkh2Jo",
    appId: "1:804852018140:android:556efd5f13e71b779d7d19",
    messagingSenderId: "804852018140",
    projectId: "ai-match-making-app", ), );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Match Making',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}