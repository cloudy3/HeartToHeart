import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hth/helper/constants.dart';
import 'package:hth/services/database.dart';
import 'package:hth/widgets/widgets.dart';
class ConversationScreen extends StatefulWidget {
  final String chatRoomId;
  ConversationScreen(this.chatRoomId);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController messageController = new TextEditingController();

  Stream chatMessageStream;

  Widget chatMessageList(){
    return StreamBuilder(
      stream: chatMessageStream,
      builder: (context, snapshot){
        return snapshot.hasData ? ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context,index){
              return MessageTile(
                  snapshot.data.documents[index].data["message"],
                  snapshot.data.documents[index].data["sendBy"] == Constants.myName
              );
            }) : Container();
      },
    );
  }

  sendMessage(){
    if (messageController.text.isNotEmpty){
      Map<String, dynamic> messageMap = {
        "message" : messageController.text,
        "sendBy" : Constants.myName,
        "time" : DateTime.now().microsecondsSinceEpoch
      };
      databaseMethods.addConversationMessages(widget.chatRoomId, messageMap);
      messageController.text = "";
    }
  }

  @override
  void initState() {
    databaseMethods.getConversationMessages(widget.chatRoomId).then((value){
      setState(() {
        chatMessageStream = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar : appBarMain(context),
      body:  SafeArea(
        child: Container(
          child: Stack(
            children: [
              chatMessageList(),
              Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  color: Colors.black87,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                            controller: messageController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: "Message...",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                border: InputBorder.none
                            ),
                          )
                      ),
                      SizedBox(width: 16,),
                      GestureDetector(
                        onTap: (){
                          sendMessage();
                        },
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      const Color(0x36FFFFFF),
                                      const Color(0x0FFFFFFF)
                                    ],
                                    begin: FractionalOffset.topLeft,
                                    end: FractionalOffset.bottomRight
                                ),
                                borderRadius: BorderRadius.circular(40)
                            ),
                            padding: EdgeInsets.all(12),
                            child: Image.asset("images/send.png",
                              height: 25, width: 25,)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MessageTile extends StatelessWidget {
  final String messageShown;
  final bool isSendByMe;
  MessageTile(this.messageShown, this.isSendByMe);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: isSendByMe? 0: 24, right: isSendByMe ? 24 : 0),
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: isSendByMe ? EdgeInsets.only(left:30) : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSendByMe ? [
              const Color(0xFF81A6A4),
              const Color(0xFF81A6A4)
            ] : [
              const Color(0xFFEDBFA6),
              const Color(0xFFEDBFA6)
            ],
          ),
          borderRadius: isSendByMe ? BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomLeft: Radius.circular(23)
          ) : BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomRight: Radius.circular(23)
          ),
        ),
        child: Text(messageShown,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white,
                fontSize: 17
            )),
      ),
    );
  }
}

