import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:convert';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home:SignUp(),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(50.0, 80.0, 50.0, 20.0),
                child: Text(
                  'Get started with your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.3,
                      fontSize: 35.0,
                      fontFamily: 'Pacifico',
                      color: Colors.blue
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                child: Text(
                  "Join one of the world's foremost secure financial services today!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.0,
                    fontSize: 20.0,
                    fontFamily: 'OxygenMono',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Name'
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Password'
                  ),
                ),
              ),
              Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.black, borderRadius: BorderRadius.circular(40)),
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MainPage()));
                  },
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(70.0, 35.0, 2.0, 15.0),
                    child: Text(
                      'Already a member?',
                      style: TextStyle(
                        fontFamily: 'OxygenMono',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(3.0, 35.0, 30.0, 15.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Login()));
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          fontFamily: 'OxygenMono',
                          decoration: TextDecoration.underline,
                          fontSize: 20.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(50.0, 80.0, 50.0, 20.0),
                child: Text(
                  'Login to your registered account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.3,
                      fontSize: 35.0,
                      fontFamily: 'Pacifico',
                      color: Colors.blue
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                child: Text(
                  "Your credentials are stored in a secure, independent and encrypted personal vault.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.0,
                    fontSize: 20.0,
                    fontFamily: 'OxygenMono',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Name'
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Password'
                  ),
                ),
              ),
              Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.black, borderRadius: BorderRadius.circular(40)),
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MainPage()));
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(80.0, 35.0, 2.0, 15.0),
                    child: Text(
                      'Not a member?',
                      style: TextStyle(
                        fontFamily: 'OxygenMono',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(3.0, 35.0, 30.0, 15.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => SignUp()));
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontFamily: 'OxygenMono',
                          decoration: TextDecoration.underline,
                          fontSize: 20.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SecuraServe',
              style: TextStyle(
                fontSize: 45.0,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold,
              ),
            ),
            Image(
              image: AssetImage('assets/Image4.png'),
              height: 40.0,
              width: 40.0,
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 20.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Credential()));
              },
              child: Center(
                child: Text(
                  'Check for Credential Leak',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OxygenMono',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            height: 110.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                //color: Colors.blue,
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),BlendMode.srcOver),
                    image: new AssetImage(
                      "assets/Image5.png",
                    ),
                    fit: BoxFit.fill
                )
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 20.0),
            child: Center(
              child: Text(
                'Stock Prediction',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OxygenMono',
                  color: Colors.white,
                ),
              ),
            ),
            height: 110.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                //color: Colors.blue,
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),BlendMode.srcOver),
                    image: new AssetImage(
                      "assets/Image6.png",
                    ),
                    fit: BoxFit.fill
                )
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 20.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Loan()));
              },
              child: Center(
                child: Text(
                  'Loan Procurement',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OxygenMono',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            height: 110.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                //color: Colors.blue,
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),BlendMode.srcOver),
                    image: new AssetImage(
                      "assets/Image7.png",
                    ),
                    fit: BoxFit.fill
                )
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 20.0),
            child: Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => PassPage()));
                },
                child: Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OxygenMono',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            height: 110.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                //color: Colors.blue,
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),BlendMode.srcOver),
                    image: new AssetImage(
                      "assets/Image8.png",
                    ),
                    fit: BoxFit.fill
                )
            ),
          ),
        ],
      ),
    );
  }
}

class Credential extends StatelessWidget {
  const Credential({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 20.0),
                padding: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 10.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Did you know?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'There have been 2,953 breaches in 2020, a 51% increase from 2019...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.0,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                height: 210.0,
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(15),
                  //color: Colors.blue,
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),BlendMode.srcOver),
                        image: new AssetImage(
                          "assets/Image5.png",
                        ),
                        fit: BoxFit.fill
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
                child: Text(
                  'Check whether your phone number or email is in a data breach',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'OxygenMono',
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'Enter email id or phone number',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  'CONFIRM',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OxygenMono',
                      fontSize: 20.0
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  //fixedSize: 50.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  side: BorderSide(width: 2.0, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Loan extends StatefulWidget {
  const Loan({key}) : super(key: key);

  @override
  _LoanState createState() => _LoanState();
}

class _LoanState extends State<Loan> {

  Interpreter interpreter;
  var age = 10;
  var exp = 10;
  var income = 10;
  var zip = 10;
  var fam = 10;
  var cc = 10;
  var edu = 10;
  var mort = 10;
  var loan = 10;
  var sec = 10;
  var cda = 10;
  var online = 10;
  var cred = 10;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
  }

  void loadModel() async {
    // Creating the interpreter using Interpreter.fromAsset
    interpreter = await Interpreter.fromAsset('amex_loan_predictor.tflite');
    print('Interpreter loaded successfully');
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 20.0),
            padding: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 10.0),
            child: Center(
              child: Text(
                'Loan Procurement',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OxygenMono',
                  color: Colors.white,
                ),
              ),
            ),
            height: 210.0,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(15),
              //color: Colors.blue,
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),BlendMode.srcOver),
                    image: new AssetImage(
                      "assets/Image7.png",
                    ),
                    fit: BoxFit.fill
                )
            ),
          ),
          Container(
            child: Text(
              'Fill out the following details:',
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'OxygenMono',
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 5.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Age (in years)',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onSubmitted: (val) {
                        age = int.parse(val);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 5.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Experience (in years)',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onSubmitted: (val) {
                        exp = int.parse(val);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 5.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Income (in thousands)',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onSubmitted: (val) {
                        income = int.parse(val);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 5.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'ZIP Code',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onSubmitted: (val) {
                        zip = int.parse(val);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 5.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Number of family members',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onSubmitted: (val) {
                        fam = int.parse(val);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 5.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Self Employed? (Y/N)',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onSubmitted: (val) {
                        age = int.parse(val);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 5.0),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Applicant Income',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 5.0),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Loan Amount (in thousands)',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 5.0),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Loan term (in months)',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              doInference();
            },
            child: Text(
              'CONFIRM',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OxygenMono',
                  fontSize: 20.0
              ),
            ),
            style: OutlinedButton.styleFrom(
              //fixedSize: 50.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
              ),
              side: BorderSide(width: 2.0, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }


  doInference() {

    var inputArr = [
      -1.736711,
      -1.778479,
      -1.670198,
      -0.536557,
      -0.944688,
      1.408446,
      -0.193003,
      -1.047833,
      -0.553823,
      2.910636,
      -0.255097,
      -1.212224,
      -0.644897
    ];


    // if output tensor shape [1,2] and type is float32
    var output = List(1 * 2).reshape([1, 2]);
    // inference
    interpreter.run(inputArr, output);
    // print the output
    print(output[0]);
    // setState(() {
    //   result = output[0][0].toStringAsFixed(2) + " MPG";
    //   print(result);
    // });
  }

}


class PassPage extends StatelessWidget {
  const PassPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 20.0),
                padding: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 10.0),
                child: Center(
                  child: Text(
                    'Change Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OxygenMono',
                      color: Colors.white,
                    ),
                  ),
                ),
                height: 210.0,
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(15),
                  //color: Colors.blue,
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),BlendMode.srcOver),
                        image: new AssetImage(
                          "assets/Image8.png",
                        ),
                        fit: BoxFit.fill
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'User id',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'Current Password',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'New password',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'Confirm new password',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  'CONFIRM',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OxygenMono',
                      fontSize: 20.0
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  //fixedSize: 50.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  side: BorderSide(width: 2.0, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}