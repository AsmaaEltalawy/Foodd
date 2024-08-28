import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController mycontroller = TextEditingController();
  String input = "";

  void getinputmessage() {
    setState(() {
      input = mycontroller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: mycontroller,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(),
                  hintText: "Enter your Email"),
            ),
          ),
          Text(input),
          ElevatedButton(onPressed: getinputmessage, child: Text("Tap"))
        ],
      )),
    );
  }
}
