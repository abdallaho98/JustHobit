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
        backgroundColor: Color(0xFFd1d3d4),
        body: new Container(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.only(top: 100.0)),
                new Image.asset('images/logo.png' , width: 160.0 , height: 202.0,),

                new Padding(padding: EdgeInsets.only(top: 26.0)),

                new FlatButton(

                    onPressed: () => _gSignin(),
                    color: Colors.red,
                    child: new Text(
                      "Sign in with Google",
                      textDirection: TextDirection.ltr,
                      style: new TextStyle(color: Colors.white),
                    )),
                new Padding(padding: EdgeInsets.only(top: 18.0)),
                new FlatButton(
                    onPressed: () => _gSignin(),
                    color: Colors.blueAccent,
                    child: new Text(
                      "Sign in with Facebook",
                      textDirection: TextDirection.ltr,
                      style: new TextStyle(color: Colors.white),
                    )),

              ],
            )
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



