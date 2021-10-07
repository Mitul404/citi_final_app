import 'package:flutter/material.dart';
import 'package:amex_final_app/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:amex_final_app/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView()
  {
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn)
      {
        return SignIn(toggleView: toggleView);
      }
    else
      {
        return Register(toggleView: toggleView);
      }
  }
}
