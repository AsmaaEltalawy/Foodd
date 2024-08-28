import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/pages/page2.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  var current_number = 0;

  void increment() {
    setState(() {
      current_number++;
    });
  }

  void recet() {
    setState(() {
      current_number = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You pushed the puttom many times'),
            Text(current_number.toString()),
            Bottom(title: 'Increment', y: increment),
            const SizedBox(
              height: 12,
            ),
            Bottom(title: 'Reset', y: recet),
            const SizedBox(
              height: 12,
            ),
            Bottom(
                title: 'Navigate to second page',
                y: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (contex) => page2()));
                }),
            const SizedBox(
              height: 12,
            ),
            Bottom(
                title: 'Navigate to second page',
                y: () {
                  Navigator.pushNamed(context, '/secondPage');
                }),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.cyan,
        child: Column(
          children: [const DrawerHeader(child: Icon(Icons.person)), ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap:(){
              Navigator.pushNamed(context, '/secondPage');
            },
          )],
        ),
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  final String title;

  VoidCallback y;

  Bottom({required this.title, required this.y});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: y,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[100]),
      child: Text(
        title,
        style: const TextStyle(color: Colors.cyan),
      ),
    );
  }
}
