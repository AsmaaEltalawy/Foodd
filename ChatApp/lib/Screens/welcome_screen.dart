import 'package:chatapp/Components/my_buttons.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Image.asset("images/speak.png"),
              ),
              const Text(
                'MessageMe',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xffdb3a70)),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyButtons(
                    color: const Color(0xFFFDD33A),
                    name: 'Sign In',
                    onPressed: () {
                      Navigator.pushNamed(context, '/SignIn');
                    },
                  )),
              MyButtons(color: const Color(0xffdb3a70), name: 'Register', onPressed: (){
                Navigator.pushNamed(context, '/Registration');
              })
            ],
          ),
        ),
      ),
    );
  }
}
