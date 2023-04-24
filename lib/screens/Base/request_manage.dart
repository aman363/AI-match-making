import 'package:flutter/material.dart';
import '../../reusable_widgets/reusable_widgets.dart';

class Request_manage extends StatefulWidget {
  const Request_manage({Key? key}) : super(key: key);

  @override
  State<Request_manage> createState() => _Request_manageState();
}

class _Request_manageState extends State<Request_manage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,

            bottom: const TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Lists of Requests',

                ),
                Tab(
                  text: 'List of Registered Teams',

                ),

              ],

            ),

            title: const Text('Requests Management',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),)

        ),

        body: const TabBarView(
          children: [
            Center(
              child: CustomLogoWidget(
                imagePath: "assets/images/requestmanage.png",
                text: "Here you will see request from other team",
              ),
            ),
            // IncomingPage(),
            Center(
              child: CustomLogoWidget(
                imagePath: "assets/images/requestmanage-2.png",
                text: "You will see the opponent team you applied for here.",
              ),
            ),
            // OutgoingPage(),
          ],
        ),

      ),
    );
  }
}
