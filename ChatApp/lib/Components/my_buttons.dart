import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final Color color;

  final String name;
  final VoidCallback onPressed;

   MyButtons({required this.color, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: color,
      borderRadius: BorderRadius.circular(8),
      child: MaterialButton(
        minWidth: 200,
        onPressed: onPressed,
        height: 42,
        child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
