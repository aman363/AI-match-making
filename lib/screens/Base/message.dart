import 'package:flutter/material.dart';
import '../../reusable_widgets/reusable_widgets.dart';
class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
                  text: 'Established Match',

                ),
                Tab(
                  text: 'Communication',

                ),

              ],

            ),

            title: const Text('Messages',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),)

        ),
        body: const TabBarView(
          children: [
            Center(
              child: CustomLogoWidget(
                imagePath: "assets/images/message.png",
                text: "The opponent with whom the practice match was established will be displayed here",
              ),
            ),
            // IncomingPage(),
            Center(
              child: CustomLogoWidget(
                imagePath: "assets/images/ri_message-2-fill.png",
                text: "The interaction with the opponent with whom the practice match was established will be displayed here",
              ),
            ),
            // OutgoingPage(),
          ],
        ),
      ),
    );
  }
}
