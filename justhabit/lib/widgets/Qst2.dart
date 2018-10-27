import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:justhabit/Model/User.dart';
import 'package:justhabit/widgets/home.dart';

FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;



class qst2 extends StatelessWidget {


  final User member;
  qst2(this.member);
  String op1 = "" , op2 = "" , op3 = "" , op4 = "";


  @override
  Widget build(BuildContext context) {


    void chose(String selected){
      firebaseDatabase.reference().child("Users").child(member.id).set({"Topic" : selected ,"hobit" : member.hobit , "email" : member.email});
      member.topic = selected;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => new home(member)),
      );
    }

    if (member.hobit == "Sport"){op1 = "Football" ; op2 = "NBA" ; op3 = "HandBall" ; op4 = "Tennis";}
    if (member.hobit == "Literator"){op1 = "Historique" ; op2 = "Policier" ; op3 = "Philosophie" ; op4 = "Culturel";}
    if (member.hobit == "Music"){op1 = "POP" ; op2 = "ROCK" ; op3 = "RAP" ; op4 = "RAY";}
    if (member.hobit == "Film"){op1 = "Action" ; op2 = "Aventure" ; op3 = "Sci-fi" ; op4 = "Romance";}
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("JustHobbit"),
      ),
     backgroundColor: Colors.grey,
      body: new Center(
        child: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("images/background.PNG"), fit: BoxFit.cover,),
            ),
          child: new Padding(padding: EdgeInsets.only(left: 24.0,right: 24.0 ,) ,
            child:new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Chose a ${member.hobit} that you prefered the most:" , style: new TextStyle(color: Colors.white , fontSize: 21.0,) ,textAlign: TextAlign.center,),

                new Padding(padding: EdgeInsets.only(top: 24.0)),

                new RaisedButton(onPressed: () => chose(op1) ,
                    elevation: 10.0,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                    color: const Color(0xFF4348a5),
                    padding: EdgeInsets.only(top: 16.0,bottom: 16.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(op1 , style: new TextStyle(fontSize: 18.0 ,fontFamily: "Palatino",color: Colors.white), ),
                      ],
                    )
                ),

                new Padding(padding: EdgeInsets.only(top: 24.0)),

                new RaisedButton(onPressed: () => chose(op3) ,
                    elevation: 10.0,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                    color: const Color(0xFFdce11f),
                    padding: EdgeInsets.only(top: 16.0,bottom: 16.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(op3 , style: new TextStyle(fontSize: 18.0 ,fontFamily: "Palatino",color: Colors.white), ),
                      ],
                    )
                ),

                new Padding(padding: EdgeInsets.only(top: 24.0)),

                new RaisedButton(onPressed: () => chose(op4) ,
                    elevation: 10.0,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                    color: const Color(0xFFe79124),
                    padding: EdgeInsets.only(top: 16.0,bottom: 16.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(op4 , style: new TextStyle(fontSize: 18.0 ,fontFamily: "Palatino",color: Colors.white), ),
                      ],
                    )
                ),

                new Padding(padding: EdgeInsets.only(top: 24.0)),

                new RaisedButton(onPressed: () => chose(op2) ,
                    elevation: 10.0,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                    color: const Color(0xFFed1f24),
                    padding: EdgeInsets.only(top: 16.0,bottom: 16.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(op2 , style: new TextStyle(fontSize: 18.0 ,fontFamily: "Palatino",color: Colors.white), ),
                      ],
                    )
                ),
              ],
            ),
          )
      ),
      ),
    );
  }

}