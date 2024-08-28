import 'package:animation/color_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TryStack extends StatelessWidget {
  const TryStack({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ColorProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          focusColor: Colors.white,
          foregroundColor: Colors.white,
          onPressed: () {
            provider.ChangeSize();
          },
          child: const Icon(Icons.play_arrow),
        ),
        body: Stack(
          children: [
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Youssef, I love you',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'more than you imagine',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'You mean the world to me! ',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              top: provider.top,
              left: 390,
              duration: const Duration(seconds: 4),
              child: Container(
                width: 250,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                    child: Icon(
                  CupertinoIcons.question,
                  size: 30,color: Colors.white,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
