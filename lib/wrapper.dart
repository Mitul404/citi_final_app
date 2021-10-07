import 'package:flutter/material.dart';
import 'package:amex_final_app/homepage.dart';
import 'package:amex_final_app/authenticate.dart';
import 'package:amex_final_app/main.dart';
import 'package:provider/provider.dart';
import 'package:amex_final_app/user.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Userabc>(context);
    //print(user);

    if(user==null)
      {
        return Authenticate();
      }
    else
      {
        return MainPage();
      }
  }
}
