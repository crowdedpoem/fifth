import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                MaterialButton(
                  // colour: Colors.lightBlueAccent,
                  // title: 'Log In',
                  onPressed: () {
                    Navigator.pushNamed(context, 'login_screen');
                  },
                ),
                MaterialButton(
                    // colour: Colors.blueAccent,
                    // title: 'Register',
                    onPressed: () {
                  Navigator.pushNamed(context, 'registration_screen');
                }),
              ]),
        ));
  }
}
