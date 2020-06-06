import 'package:flutter/material.dart';
import 'package:hth/services/database.dart';
import 'package:hth/view/conversation.dart';
import 'package:hth/view/search.dart';
import 'package:hth/widgets/widgets.dart';
import '../helper/constants.dart';
import 'package:hth/helper/helperFunction.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  DatabaseMethods databaseMethods = new DatabaseMethods();
  Stream chatRoomsStream;

  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRoomsStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
            itemCount: snapshot.data.documents.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ChatRoomsTile(
                snapshot.data.documents[index].data['chatRoomId'].toString().replaceAll("_", "").replaceAll(Constants.myName, ""),
                snapshot.data.documents[index].data["chatRoomId"],
              );
            })
            : Container();
      },
    );
  }
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    databaseMethods.getChatRooms(Constants.myName).then((snapshots){
      chatRoomsStream = snapshots;
      setState(() {

      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: chatRoomsList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => SearchScreen()
          ));
        },
      ),
    );
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;
  ChatRoomsTile(this.userName, this.chatRoomId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ConversationScreen(chatRoomId)
        ));
      },
      child: Container(
          color: Colors.lightBlue.shade100,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child:
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.blue
                ),
                child: Text("${userName.substring(0,1).toUpperCase()}",
                  style: biggerTextStyle(),),
              ),
              SizedBox(width: 8,),
              Text(userName, style: biggerTextStyle(),)
            ],
          )
      ),
    );
  }
}

