import 'package:flutter/material.dart';
import 'package:hth/services/auth.dart';
import 'package:hth/services/database.dart';
import 'package:hth/view/tabPage.dart';
import 'package:hth/widgets/widgets.dart';
import 'package:hth/helper/helperFunction.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SignUp extends StatefulWidget {

  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  bool isLoading = false;
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController usernameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  signMeUp(){
    if (formKey.currentState.validate()){

      Map<String, String> userInfoMap = {
        "name": usernameTextEditingController.text,
        "email": emailTextEditingController.text
      };

      HelperFunctions.saveUserEmailSharedPreference(emailTextEditingController.text);
      HelperFunctions.saveUserNameSharedPreference(usernameTextEditingController.text);
      setState(() {
        isLoading = true;
      });
      authMethods.signUpWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text).then((val){
        print("$val");


        databaseMethods.uploadUserInfo(userInfoMap);
        HelperFunctions.saveUserLoggedInSharedPreference(true);
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => tabPage()
        ));
      });
    }
  }

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
      setState(() {});
      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    TypewriterAnimatedTextKit(
                      text: ["Chat With Us"],
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.0,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val){
                          return val.isEmpty || val.length < 2 ?  "Please provide a valid Username": null;
                        },
                        controller: usernameTextEditingController,
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("username"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
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
                SizedBox(height: 16,),
                GestureDetector(
                  onTap: (){
                    signMeUp();
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
                                  const Color(0xff007EF4),
                                  const Color(0xff2A75BC)
                                ]
                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Text("Sign Up", style: biggerTextStyle(),),
                      ),
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have account? ", style: biggerTextStyle(),),
                    GestureDetector(
                      onTap: (){
                        widget.toggle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Sign in now", style: TextStyle(
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