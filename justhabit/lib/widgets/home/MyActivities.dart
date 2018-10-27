import 'package:flutter/material.dart';
import 'package:justhabit/Model/User.dart';

class MyActivities extends StatefulWidget{
  User _user;
  MyActivities(this._user);
  @override
  State<StatefulWidget> createState() {
    return new myActivities(_user);
  }

}

class myActivities extends State<MyActivities> {
  User _user;
  myActivities(this._user);
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          
          new Padding(padding: EdgeInsets.only(top: 10.0)),
          
          new Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color(0xFFed1f24),
              ),

              child: new Padding(padding: EdgeInsets.only(top: 10.0 , bottom: 10.0) ,
                child:new Row(
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(left : 30.0)),
                    new Column(
                      children: <Widget>[

                        new Text( "Courage", style: new TextStyle(fontSize: 16.0 ,fontFamily: "Palatino",color: Colors.white),textAlign: TextAlign.left, ),
                        new Text( "Remaining 1:You're about to finnish", style: new TextStyle(fontSize: 10.0 ,fontFamily: "Palatino",color: Colors.white), ),
                      ],
                    ),

                    new Padding(padding: EdgeInsets.only(left : 50.0)),

                    new Image.asset("images/icon.png" , width: 68.0, height: 68.0,)
                  ],
                ) ,)
          ),
          new Padding(padding: EdgeInsets.only(top: 10.0)),



          new Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color(0xFF2e3192),
              ),

              child: new Padding(padding: EdgeInsets.only(top: 10.0 , bottom: 10.0),
              child: new Row(

                children: <Widget>[
                  new Padding(padding: EdgeInsets.only(left : 30.0)),
                  new Column(
                    children: <Widget>[

                      new Text( "Hints to succeed", style: new TextStyle(fontSize: 16.0 ,fontFamily: "Palatino",color: Colors.white),textAlign: TextAlign.left, ),
                      new Text( "Read Rish and power dad", style: new TextStyle(fontSize: 10.0 ,fontFamily: "Palatino",color: Colors.white), ),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.only(left : 98.0)),
                  new Image.asset("images/open-book.png" , width: 68.0, height: 68.0,)
                ],
              ),)
          ),
        ],
      ),
    );
  }
}