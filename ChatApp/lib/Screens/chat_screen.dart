import 'package:chatapp/Components/messageLine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
final _fireStore = FirebaseFirestore.instance;
class _ChatScreenState extends State<ChatScreen> {

  final _auth = FirebaseAuth.instance;
  String? txt;
  late User signedInUser;

  @override
  void initState() {
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }
  void messageStream() async {
    await for (var snapshot in _fireStore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6f2e42),
        title: Row(
          children: [
            Image.asset(
              'images/speak.png',
              height: 25,
            ),
            const SizedBox(width: 10),
            const Text(
              'MessageMe',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stream(),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xffdb3a70), width: 2),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      txt = value;
                    },
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        hintText: 'Write your message here'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _fireStore.collection('messages').add({
                      'sender': signedInUser.email,
                      'text': txt,
                    });
                  },
                  child: const Text(
                    'Send',
                    style: TextStyle(
                        color: Color(0xffdb3a70),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}



class Stream extends StatelessWidget {
  const Stream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _fireStore.collection('messages').snapshots(),
        builder: (context, snapshot) {
          List<MessageLine> messageWidgets = [];
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.pink,
              ),
            );
          } else {
            final messages = snapshot.data!.docs;
            for (var message in messages) {


              final messageText = message.get('text') ?? 'No message';
              final messageSender =
                  message.get('sender') ;
              final messageWidget = MessageLine(
                text: messageText,
                mail: messageSender,
              );
              messageWidgets.add(messageWidget);
            }
          }

          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              children: messageWidgets,
            ),
          );
        });
  }
}
