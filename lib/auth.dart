import 'package:firebase_auth/firebase_auth.dart';
import 'package:amex_final_app/user.dart';
class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //ceate user object based on firebase user
  Userabc _userFromFirebaseUser(User user)
  {
    return user!=null ? Userabc(uid: user.uid) : null;
  }

  //Auth change user stream
  Stream<Userabc> get user{
    return _auth.authStateChanges().map((User user) => _userFromFirebaseUser(user));
  }

  //sign in anonymously
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email,String password) async
  {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email,String password) async
  {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
}