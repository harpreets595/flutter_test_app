import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebaseUser
  TheUser _userFromFirebaseUser(User user){
    return user != null ? TheUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<TheUser> get user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
        //.map((User user) => _userFromFirebaseUser(user));
  }

  // sign in anon
  Future signInAnon() async {
    try {
       UserCredential result = await _auth.signInAnonymously();
       User user = result.user;
       return _userFromFirebaseUser(user);
    }
    catch (e){
      print(e.toString());
      return null;
    }
  }


  // sign in email and password

  // register with email & password
}
