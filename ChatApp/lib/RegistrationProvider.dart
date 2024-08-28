import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationProvider with ChangeNotifier {
  bool saving = false;
  final _auth = FirebaseAuth.instance;
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  Future<void> addUser(BuildContext context) async {
    try {
      saving = true;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(
          email: email.text, password: pass.text);

      Navigator.pushNamed(context, '/ChatScreen');

      email.clear();
      pass.clear();
      saving = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The email address is already in use.'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred: ${e.message}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
     // saving = false;


    notifyListeners();}
  }
}
