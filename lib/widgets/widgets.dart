import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context){
  return AppBar(
    backgroundColor: Colors.green.shade400,
  );
}

InputDecoration textFieldInputDecoration(String hintText){
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.black87),
    contentPadding:
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}

TextStyle simpleTextStyle(){
  return TextStyle(
      color: Colors.black87,
      fontSize: 16
  );
}

TextStyle biggerTextStyle(){
  return TextStyle(
      color: Colors.black87,
      backgroundColor: Colors.transparent,
      fontSize: 17
  );
}