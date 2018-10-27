import 'package:flutter/material.dart';
import 'package:justhabit/Model/Activitie.dart';
import 'package:justhabit/Model/Idole.dart';
import 'package:justhabit/Model/User.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:justhabit/main.dart';
import 'package:justhabit/widgets/home/Profile.dart';

FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;


class Search extends StatefulWidget{
  User _user;
  Search(this._user);

  @override
  State<StatefulWidget> createState() {
    return new search(_user);
  }

}

class search extends State<Search> {
  List<Idole> list = new List<Idole>();
  Idole idole;
  DatabaseReference data;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  User _user;
  search(this._user);
  @override
  void initState() {
    data = firebaseDatabase.reference().child("Idoles");
    data.onChildAdded.listen(_listen);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.grey,
        child: new Center(
            child: FirebaseAnimatedList(
              query: data,
              itemBuilder: (_,DataSnapshot snapshot,Animation<double> animation , int index){
                if(list[index].topic.toLowerCase() != _user.hobit.toLowerCase()){return new Container(height: 0.0,) ;}
                else{
                return new Card(
                  color: Colors.black,
                  child: ListTile(
                    title: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Text("${list[index].fullName}" , style: new TextStyle(color: Colors.white),),
                          new Divider(color: Colors.white,)
                        ],
                      )
                    ),
                    leading: new CircleAvatar(
                      backgroundImage: new NetworkImage('${list[index].photo}'),
                    ),
                    subtitle: new Padding(padding: EdgeInsets.only(left:70.0 , right: 70.0) ,
                      child: new Container(
                        color: Colors.redAccent,
                        alignment: AlignmentDirectional.center,
                        child :new Text("${list[index].topic}", style: new TextStyle(color: Colors.white ),
                        ),
                      ),
                    ),
                    onTap:() => chose(_user,list[index]),
                  ),
                );}
              },
            ))
    );
  }




  void _listen(Event event) {
    setState(() {
      DataSnapshot snap = event.snapshot;
      Idole idole = Idole.fromSnapshot(event.snapshot);
      idole.activities = new List<Activitie>();
      for (var value in snap.value["Activities"].values){
        idole.activities.add(new Activitie(value["Description"], value["start"], value["end"]));
      }
      list.add(idole);
    });
  }

  void chose(User user,Idole idole){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Profile(user , idole)),
    );
  }
}

