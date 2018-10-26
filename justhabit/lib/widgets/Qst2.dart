import 'package:flutter/material.dart';





class qst2 extends StatelessWidget {


  final String member;
  qst2(this.member);
  String op1 = "" , op2 = "" , op3 = "" , op4 = "";


  @override
  Widget build(BuildContext context) {
    if (member == "Sport"){op1 = "Football" ; op2 = "NBA" ; op3 = "HandBall" ; op4 = "Tennis";}
    if (member == "Literator"){op1 = "Historique" ; op2 = "Policier" ; op3 = "Philosophie" ; op4 = "Culturel";}
    if (member == "Music"){op1 = "POP" ; op2 = "ROCK" ; op3 = "RAP" ; op4 = "RAY";}
    if (member == "Film"){op1 = "Action" ; op2 = "Aventure" ; op3 = "Sci-fi" ; op4 = "Romance";}
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
          width: 250.0,
          height: 150.0,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Chose your prefered:"),
              new Padding(padding: EdgeInsets.only(top: 18.0)),
              new Row(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.only(left: 20.0)),
                  new RaisedButton(onPressed: () => debugPrint(op1) , color: Colors.blueGrey, child: new Text(op1),),
                  new Padding(padding: EdgeInsets.only(left: 30.0)),
                  new RaisedButton(onPressed: () => debugPrint(op2)  , color: Colors.blueGrey, child: new Text(op2),),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.only(left: 20.0)),
                  new RaisedButton(onPressed: () => debugPrint(op3)  , color: Colors.blueGrey, child: new Text(op3),),
                  new Padding(padding: EdgeInsets.only(left: 30.0)),
                  new RaisedButton(onPressed: () => debugPrint(op4)  , color: Colors.blueGrey, child: new Text(op4),),
                ],
              ),

          ],
        ),
      ),
      ),
    );
  }

}