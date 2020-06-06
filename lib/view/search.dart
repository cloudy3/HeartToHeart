import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hth/view/conversation.dart';
import 'package:hth/widgets/widgets.dart';
import 'package:hth/services/database.dart';
import 'package:hth/helper/constants.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController = new TextEditingController();

  QuerySnapshot searchSnapshots;

  Widget searchList(){
    return searchSnapshots != null ?ListView.builder(
        itemCount: searchSnapshots.documents.length,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return SearchTile(
            userName: searchSnapshots.documents[index].data["name"],
            userEmail: searchSnapshots.documents[index].data["email"],
          );
        }) : Container();
  }

  initiateSearch(){
    databaseMethods.getUserByUsername(searchTextEditingController.text).then((val){
      setState(() {
        searchSnapshots = val;
      });
    });
  }

  // create chatroom, send user to conversation page, pushReplacement

  createChatRoomAndStartConversation({String userName}){
    if (userName != Constants.myName){
      String chatRoomId = getChatRoomId(userName, Constants.myName);
      List<String> users = [userName, Constants.myName];
      Map<String, dynamic> chatRoomMap = {
        "users" : users,
        "chatRoomId": chatRoomId
      };
      DatabaseMethods().createChatRoom(chatRoomId, chatRoomMap);
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => ConversationScreen(chatRoomId)
      ));
    } else {
      print("Bro you lonely af");
    }
  }

  Widget SearchTile({String userName, String userEmail}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: biggerTextStyle(),),
              Text(userEmail, style: biggerTextStyle(),)
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              createChatRoomAndStartConversation(
                  userName: userName
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueAccent.shade100,
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Text("Message", style: biggerTextStyle(),),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: appBarMain(context),
        body: Container (
          child: Column(
            children: [
              Container(
                color: Color(0x54FFFFFF),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          controller: searchTextEditingController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: "Search username...",
                              hintStyle: TextStyle(
                                color: Colors.white54,
                              ),
                              border: InputBorder.none
                          ),
                        )
                    ),
                    GestureDetector(
                      onTap: (){
                        initiateSearch();
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    const Color(0x36FFFFFF),
                                    const Color(0x0FFFFFFF)
                                  ]
                              ),
                              borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(10),
                          child: Image.asset("images/search_white.png")),
                    )
                  ],
                ),
              ),
              searchList()
            ],
          ),
        )
    );
  }
}

getChatRoomId(String a, String b){
  if (a.substring(0,1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}

