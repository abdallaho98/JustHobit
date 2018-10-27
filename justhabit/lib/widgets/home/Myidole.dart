import 'package:flutter/material.dart';
import 'package:justhabit/Model/Activitie.dart';
import 'package:justhabit/Model/Idole.dart';
import 'package:justhabit/Model/User.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;


class Myidole extends StatefulWidget{
  User _user;
  Myidole(this._user);
  @override
  State<StatefulWidget> createState() {
    return new myidole(_user);
  }

}

class myidole extends State<Myidole> {
  User _user;
  List<Activitie> list = new List<Activitie>();
  myidole(this._user);
  DatabaseReference data;

  void initState() {
    data = firebaseDatabase.reference().child("Users").child(_user.id).child("Todo");
    data.onChildAdded.listen(_listen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return new Container(
            color: Colors.white70,
            child: new Center(
            child: FirebaseAnimatedList(
            query: data,
            itemBuilder: (_,DataSnapshot snapshot,Animation<double> animation , int index){
            return new Card(
              color: Color(0xFF2e3192),
              child: new ListTile(
                title: new Text("${list[index].description}" , style: new TextStyle(color: Colors.white),),
                leading: new Container(
                  width: 50.0,
                  child: new Column(
                    children: <Widget>[
                          new Text("${list[index].start}"+ ":00" , style: new TextStyle(color: Colors.white),),
                          new Padding(padding: EdgeInsets.only(top: 20.0)),
                          new Text("${list[index].end}" + ":00" , style: new TextStyle(color: Colors.white),),
                    ],
                  )
                ),
              )
            );
          }
      ),
    ),
  );
}


  void _listen(Event event) {
    DataSnapshot snap = event.snapshot;
    Activitie act = Activitie.fromSnapshot(event.snapshot);
    list.add(act);
  }
}