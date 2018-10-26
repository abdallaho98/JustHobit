import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:justhabit/Model/User.dart';
import 'package:justhabit/widgets/Qst2.dart';

FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

class Qst1 extends StatelessWidget {
  User userGlobale;
  Qst1(this.userGlobale);

  @override
  Widget build(BuildContext context) {

    void chose(String selected){
      firebaseDatabase.reference().child("Users").child(userGlobale.id).set({"hobit" : selected , "email" : userGlobale.email});
      userGlobale.hobit = selected;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => new MaterialApp(home: new qst2(userGlobale))),
      );
    }
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("JustHobbit"),
      ),
     backgroundColor: Colors.yellowAccent,
      body: new Center(
        child: new Container(
          decoration: new BoxDecoration(
            color: Colors.deepOrange,
                borderRadius: new BorderRadius.all(const  Radius.circular(4.0)),
          ),
          width: 200.0,
          height: 150.0,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Chose your prefered topic :"),
              new Padding(padding: EdgeInsets.only(top: 18.0)),
              new Row(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.only(left: 8.0)),
                  new RaisedButton(onPressed: () => chose("Sport") , color: Colors.blueGrey, child: new Text("Sport"),),
                  new Padding(padding: EdgeInsets.only(left: 8.0)),
                  new RaisedButton(onPressed: () => chose("Literator")  , color: Colors.blueGrey, child: new Text("Literater"),),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.only(left: 8.0)),
                  new RaisedButton(onPressed: () => chose("Music")  , color: Colors.blueGrey, child: new Text("Music"),),
                  new Padding(padding: EdgeInsets.only(left: 8.0)),
                  new RaisedButton(onPressed: () => chose("Film")  , color: Colors.blueGrey, child: new Text("Film"),),
                ],
              ),

          ],
        ),
      ),
      ),
    );
  }


}