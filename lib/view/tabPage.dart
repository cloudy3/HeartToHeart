import 'package:flutter/material.dart';
import 'package:hth/services/auth.dart';
import 'package:hth/view/contactUs.dart';
import 'package:hth/view/dashBoard.dart';
import 'package:hth/helper/authenticate.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'chatRooms.dart';

class tabPage extends StatelessWidget {
  AuthMethods authMethods = new AuthMethods();
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/flower.png"),
            ),
            backgroundColor: Colors.green.shade400,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.message)),
                Tab(icon: Icon(Icons.dashboard)),
                Tab(icon: Icon(Icons.call_received)),
              ],
            ),
            actions: [
              GestureDetector(
                onTap: (){
                  Fluttertoast.showToast(msg: 'Successfully logged out');
                  authMethods.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => Authenticate()
                  ));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: (Icon(Icons.exit_to_app)),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              ChatRoom(),
              DashBoard(),
              ContactUs(),
            ],
          ),
        ),
      ),
    );
  }
}
