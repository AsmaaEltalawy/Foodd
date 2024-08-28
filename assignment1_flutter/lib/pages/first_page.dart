import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class firstpage extends StatelessWidget {
  const firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){}, child: const Text("Elevate to second page")),
        ],
      ),
    );
  }
}
