import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: Text("Settings",style: TextStyle(fontSize: 30),)),
      ),

    );
  }
}
