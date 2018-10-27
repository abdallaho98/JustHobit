import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:justhabit/Model/User.dart';
import 'package:justhabit/widgets/Qst1.dart';
import 'package:firebase_database/firebase_database.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();
FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
User userGlobale = new User();


void main() =>
    runApp(new MaterialApp(
      title: "JustHobit",
      home: new Login(),
    ));

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new login();
  }
}

class login extends State<Login> {



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text(
              "JustHobit",
              textDirection: TextDirection.ltr,
            )),
        backgroundColor: Colors.blueGrey,
        body: new Container(
          child: new Center(
            child: new FlatButton(
                onPressed: () => _gSignin(),
                color: Colors.grey,
                child: new Text(
                  "Sign in Google",
                  textDirection: TextDirection.ltr,
                  style: new TextStyle(color: Colors.lightGreen),
                )),
          ),
        ),
    );
  }

  change(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Qst1(userGlobale)),
    );
  }

  Future<FirebaseUser> _gSignin() async{
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    if(user != null){
      userGlobale.email = user.email;
      userGlobale.id = DateTime.now().millisecondsSinceEpoch.toString();
      firebaseDatabase.reference().child("Users").child(userGlobale.id).set({ "email" : userGlobale.email});
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => new Qst1(userGlobale)),
      );
    }
    return user;
  }
}



