import 'package:MEALaPP/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginSignUp extends StatefulWidget {
  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _email;

  String _password;

  newUser() async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: emailCont.text, password: passCont.text);
      FirebaseUser user = result.user;
    } catch (e) {
      print(e);
    }
  }

  login() async{
    try {
      AuthResult result =  await _auth.signInWithEmailAndPassword(
          email: emailCont.text, password: passCont.text);
      FirebaseUser user = result.user;
      print(user.email);
    } catch (e) {
      print(e);
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(18.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            loginScreen(),
          ],
        ),
      ),
    );
  }

  loginScreen() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Login',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45.0,
                letterSpacing: 3.0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 23.0),
            child: TextFormField(
              controller: emailCont,
              decoration:
                  InputDecoration(hintText: 'Email', labelText: 'Email'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 23.0),
            child: TextFormField(
              controller: passCont,
              decoration:
                  InputDecoration(hintText: 'Password', labelText: 'Password'),
            ),
          ),
          MaterialButton(
            onPressed: login,
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
