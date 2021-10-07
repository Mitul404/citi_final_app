import 'package:flutter/material.dart';
import 'package:amex_final_app/auth.dart';
import 'package:amex_final_app/constant.dart';
import 'package:amex_final_app/loading.dart';
class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password='';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text('Sign In to SecuraServ'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person,color: Colors.white,),
            label: Text('Register',style: TextStyle(color: Colors.white),),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 35.0,),
                Text(
                  'LogIn to your account',
                  style: TextStyle(fontSize: 32.0,color: Colors.blueAccent,fontFamily: 'Pacifico',),
                ),
                SizedBox(height: 40.0,),
                Text(
                  'Your credentials are stored in a secure, independent and encrypted personal vault',
                  style: TextStyle(fontSize: 20.0,color: Colors.black,letterSpacing: 2.0),
                ),
                SizedBox(height: 45.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'E-mail'),
                  validator: (val) => val.isEmpty ? 'Enter E-mail' : null,
                  onChanged: (val) {setState(() {
                    email=val;
                  });},
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  validator: (val) => val.length<6 ? 'Enter 6+ characters' : null,
                  obscureText: true,
                  onChanged: (val) {setState(() {
                    password=val;
                  });},
                ),
                SizedBox(height: 30.0,),
                RaisedButton(
                  color: Colors.black,
                  child: Text('Sign In',style: TextStyle(color: Colors.white),),
                  onPressed: () async {
                    if(_formKey.currentState.validate())
                    {
                      setState(() {
                        loading=true;
                      });
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result==null)
                      {
                        setState(() {
                          error='Couldnt Sign In with those credentials!';
                          loading=false;
                        });
                      }
                    }
                  },
                ),
                SizedBox(height: 12.0,),
                Text(
                  error,
                  style: TextStyle(color: Colors.red,fontSize: 15.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
