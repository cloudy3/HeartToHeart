import 'package:flutter/material.dart';
import 'package:hth/helper/helperFunction.dart';
import 'package:hth/view/tabPage.dart';
import 'helper/authenticate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  AnimationController animationcontroller;
  Animation animation;

  bool userIsLoggedIn;

  @override
  void initState(){
    getLoggedInState();
    super.initState();
  }


  getLoggedInState () async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Start',
      debugShowCheckedModeBanner: false,
      home: Authenticate()
//      userIsLoggedIn != null ? userIsLoggedIn? tabPage() : Authenticate() :
//      Container(
//        child: Center(
//          child:  Authenticate(),
//        ),
//      ),
    );
  }
}


