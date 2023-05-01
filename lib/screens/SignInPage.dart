import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
 // final FacebookAuth _facebookAuth = FacebookAuth.instance;

  late String _email;
  late String _password;

  Future<void> _signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      // Sign in success, do something with userCredential
    } on FirebaseAuthException catch (e) {
      // Sign in failed, display error message
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      // Sign in success, do something with userCredential
    } catch (e) {
      // Sign in failed, display error message
      print(e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (value) {
                _email = value.trim();
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              onChanged: (value) {
                _password = value.trim();
              },
            ),
            SizedBox(height: 16.0),
            MaterialButton(
              child: Text('Sign in with email'),
              onPressed: _signInWithEmailAndPassword,
            ),
            SizedBox(height: 16.0),
            MaterialButton(
              child: Text('Sign in with Google'),
              onPressed: _signInWithGoogle,
            ),
          ],
        ),
      ),
    );
  }
}