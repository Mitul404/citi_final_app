import 'package:amex_final_app/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:amex_final_app/homepage.dart';
import 'package:amex_final_app/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:amex_final_app/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userabc>.value(
      value: AuthService().user,
      child: MaterialApp(
        //debugShowCheckedModeBanner: false,
        home:Wrapper(),
      ),
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
  MainPage({key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person,color: Colors.white,),
            label: Text('Log Out',style: TextStyle(color: Colors.white,fontSize: 20.0),),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
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
            /*Image(
              image: AssetImage('assets/Image4.png'),
              height: 40.0,
              width: 40.0,
            ),*/
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
                    context, MaterialPageRoute(builder: (_) => Cred()));
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
            child: GestureDetector(
            onTap: (){
            Navigator.push(
            context, MaterialPageRoute(builder: (_) => Stock()));
            },
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

class Cred extends StatefulWidget {
  const Cred({key}) : super(key: key);

  @override
  _CredState createState() => _CredState();
}

class _CredState extends State<Cred> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
      ),
      body: const WebView(
        initialUrl: 'https://haveibeenpwned.com/',
        javascriptMode: JavascriptMode.unrestricted,
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

class Stock extends StatefulWidget {
  const Stock({key}) : super(key: key);

  @override
  _StockState createState() => _StockState();
}

class _StockState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: const WebView(
          initialUrl: 'https://aniket-stock.herokuapp.com/',
          javascriptMode: JavascriptMode.unrestricted,
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

  var mean = [
    2507.902444,
    45.350222,
    20.118889,
    73.711556,
    93149.362667,
    2.392444,
    1.937462,
    1.880000,
    56.123333,
    0.105556,
    0.061111,
    0.595111,
    0.293778
  ];
  var std = [
    1443.476936,
    11.442484,
    11.447080,
    46.055784,
    2161.944212,
    1.141368,
    1.748485,
    0.839829,
    101.338066,
    0.307302,
    0.239561,
    0.490925,
    0.455542
  ];

  Interpreter interpreter;
  String approved;
  int age = -1;
  int exp = -1;
  int income = -1;
  int zip = -1;
  int fam = -1;
  double cc = -1.0;
  int edu = -1;
  int mort = -1;
  int sec = -1;
  int cda = -1;
  int online = -1;
  int cred = -1;

  double dage, dexp, dincome, dzip, dfam, dedu, dmort, dsec, dcda, donline, dcred;


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
                        dage = age.toDouble();
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
                        dexp = exp.toDouble();
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
                        dincome = income.toDouble();
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
                        dzip = zip.toDouble();
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
                        dfam = fam.toDouble();
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
                        hintText: 'CC Avg',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onSubmitted: (val) {
                        cc = double.parse(val);
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
                        hintText: 'Education (no. of degrees)',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onSubmitted: (val) {
                        edu = int.parse(val);
                        dedu = edu.toDouble();
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
                        hintText: 'Mortgage (in thousands)',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onSubmitted: (val) {
                        mort = int.parse(val);
                        dmort = mort.toDouble();
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
                        hintText: 'Securities Account (1-yes, 0-no)',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onSubmitted: (val) {
                        sec = int.parse(val);
                        dsec = sec.toDouble();
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
                        hintText: 'CD accounts (1-yes, 0-no)',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onSubmitted: (val) {
                        cda = int.parse(val);
                        dcda = cda.toDouble();
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
                        hintText: 'Online accounts (1-yes, 0-no)',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onSubmitted: (val) {
                        online = int.parse(val);
                        donline = online.toDouble();
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
                        hintText: 'Credit cards',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      onSubmitted: (val) {
                        cred = int.parse(val);
                        dcred = cred.toDouble();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {


              doInference();
              showAlertDialog(context);
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
          ),
        ],
      ),
    );
  }

    showAlertDialog(BuildContext context) {

      // set up the button
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Is loan approved?"),
        content: Text("$approved"),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

  doInference() {

    var inputArr = [
      -1.736711,
      (age - mean[1]) / std[1],
      (exp - mean[2]) / std[2],
      (income - mean[3]) / std[3],
      (zip - mean[4]) / std[4],
      (fam - mean[5]) / std[5],
      (cc - mean[6]) / std[6],
      (edu - mean[7]) / std[7],
      (mort - mean[8]) / std[8],
      (sec - mean[9]) / std[9],
      (cda - mean[10]) / std[10],
      (online - mean[11]) / std[11],
      (cred - mean[12]) / std[12]
    ];


    // if output tensor shape [1,2] and type is float32
    var output = List(1 * 2).reshape([1, 2]);
    // inference
    interpreter.run(inputArr, output);
    // print the output
    print(output[0][0]);
    print(output[0][1]);

    if(output[0][0]>output[0][1]){
      setState(() {
        approved = 'You are ELIGIBLE for Loan!!';
      });
    }
    else{
      setState(() {
        approved = 'You are NOT ELIGIBLE for Loan';
      });
    }

    // setState(() {
    //   result = output[0][0].toStringAsFixed(2) + " MPG";
    //   print(result);
    // });
  }

}

class PassPage extends StatefulWidget {
  const PassPage({key}) : super(key: key);

  @override
  State<PassPage> createState() => _PassPageState();
}

class _PassPageState extends State<PassPage> {

  //creting firebaseinstance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  String oldpass='';
  String newpass='';
  String confirmpass='';

  Future<bool> validatePassword(String password) async {
    //var user = await _auth.currentUser;
    //UserCredential authresult = await _auth.reauth
  }

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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'User Id',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),


                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                  child: TextFormField(
                    onChanged: (val) {oldpass=val;},
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
                  child: TextFormField(
                    onChanged: (val) {newpass=val;},
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
                  child: TextFormField(
                    validator: (val) {return newpass == val ? null : 'Enter valid password';},
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
                      hintText: 'Confirm password',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  User u = _auth.currentUser;
                  if(_formKey.currentState.validate())
                    {
                      print('VALID');
                      print(oldpass);
                      print(newpass);
                    }
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
        ),
      ),
    );
  }
}

