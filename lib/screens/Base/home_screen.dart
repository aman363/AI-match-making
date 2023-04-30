import 'package:ai_match_making_app/screens/Base/match_making.dart';
import 'package:ai_match_making_app/screens/Base/message.dart';
import 'package:ai_match_making_app/screens/Base/my_page.dart';
import 'package:ai_match_making_app/screens/Base/request_manage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Match_making(),
    Request_manage(),
    Messages(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        // selectedIconTheme: const IconThemeData(color: Colors.black),
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        // selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: const IconThemeData(
          color: Colors.black38,
        ),
        unselectedItemColor: Colors.black38,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/match_making_navbar.png"),

              size: 24,
            ),
            label: 'Match-Making',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/request_management_navbar.png"),

              size: 24,
            ),
            label: 'Request Management',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/message_navbar.png"),

              size: 24,
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/my_page_navbar.png"),

              size: 24,
            ),
            label: 'My Page',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),

    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}