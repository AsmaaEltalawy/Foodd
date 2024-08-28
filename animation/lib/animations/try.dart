import 'package:animation/color_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Try extends StatelessWidget {
  const Try({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ColorProvider>(context);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            provider.ChangeSize();
          },
          child: const Icon(Icons.play_arrow),
        ),
        body: Center(
            child: AnimatedOpacity(
              opacity: provider.opacity,
              duration: const Duration(seconds: 4),
              child: AnimatedContainer(
                // curve: Curves.easeInExpo,
                width: provider.width,
                height: provider.high,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: provider.color),
                duration: const Duration(seconds: 4),
              ),
            )),
      ),
    );
  }
}
