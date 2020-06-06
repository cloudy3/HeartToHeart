import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hth/helper/authenticate.dart';
import 'package:hth/services/auth.dart';
import 'package:hth/services/database.dart';
import '../widgets/widgets.dart';
import '../helper/helperFunction.dart';
import '../view/tabPage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {

  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();
  AnimationController controller;
  Animation animation;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blue.shade200, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState((){});
      print(animation.value);
    });
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  signIn() {
    if (formKey.currentState.validate()){
      HelperFunctions.saveUserEmailSharedPreference(emailTextEditingController.text);

      databaseMethods.getUserByEmail(emailTextEditingController.text)
          .then((val){
        QuerySnapshot snapshotUserInfo = val;
        HelperFunctions.saveUserNameSharedPreference(snapshotUserInfo.documents[0].data["name"]);

      });
      // Create a function to get user details
      setState(() {
        isLoading = true;
      });



      authMethods.signInWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text)
          .then((val){
        if (val != null){
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => tabPage()
          ));
        } else {
          Fluttertoast.showToast(msg: 'Invalid password');
          HelperFunctions.saveUserLoggedInSharedPreference(false);
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Authenticate()
          ));
        }
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: isLoading ? Container(
          child: Center(child: CircularProgressIndicator())
      ) : SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/flower.png'),
                        height: 60.0,
                      ),
                    ),
                    TypewriterAnimatedTextKit (
                      text: ['Chat With Us'],
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 107.0,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val){
                          return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                          null : "Please provide a valid Email";
                        },
                        controller: emailTextEditingController,
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("email"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (val){
                          return val.length > 6 ? null: "Please provide password with more than 6 characters ";
                        },
                        controller: passwordTextEditingController,
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("password"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                GestureDetector(
                  onTap: (){
                    signIn();
                  },
                  child: Material(
                      elevation: 5.0,
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.greenAccent,
                                  Colors.greenAccent
                                ]
                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Text("Sign In", style: biggerTextStyle(),),
                      ),
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ", style: biggerTextStyle(),),
                    GestureDetector(
                      onTap: (){
                        widget.toggle();
                      },
                      child:
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Register now", style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline
                        ),),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
