import 'package:flutter/material.dart';
import 'package:justhabit/Model/Idole.dart';
import 'package:justhabit/Model/User.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;


class Profile extends StatefulWidget{
  User _user;
  Idole _idole;
  Profile(this._user, this._idole);

  @override
  State<StatefulWidget> createState() {
    return new profile(_user,_idole);
  }

}

class profile extends State<Profile> {
  bool _isFavorised = false;
  String _url = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Five-pointed_star.svg/255px-Five-pointed_star.svg.png";
  User _user;
  Idole _idole;
  profile(this._user, this._idole);


  void _favoriser(){
    setState(() {
      if(_isFavorised){_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Five-pointed_star.svg/255px-Five-pointed_star.svg.png";
      _isFavorised = false;
      firebaseDatabase.reference().child("Users").child(_user.id).child("interest").set({});
      }
      else{
        _url = "https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Gold_Star.svg/1024px-Gold_Star.svg.png" ; _isFavorised = true;
        firebaseDatabase.reference().child("Users").child(_user.id).child("interest").set({"Name" : _idole.fullName});
      }
    });
  }




  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text(_idole.fullName),
     ),
     body: new SingleChildScrollView(
       child: new Container(
         alignment: Alignment.topCenter,
         child: Padding(padding: EdgeInsets.all(24.0), child:
           new Column(children: <Widget>[

           new Padding(padding: EdgeInsets.only(top: 24.0)),

           new Container(
             width: 200.0,
             height: 200.0,
             decoration: new BoxDecoration(
                 shape: BoxShape.circle,
                 image: new DecorationImage(
                     fit: BoxFit.fill,
                     image: new NetworkImage(_idole.photo)
                 )
             ),
           ),

           new Padding(padding: EdgeInsets.only(top: 24.0)),

           new Text(_idole.fullName , style: new TextStyle(fontSize: 30.0),),

           new Padding(padding: EdgeInsets.only(top: 24.0)),

           new Text(_idole.description , style: new TextStyle(fontSize: 20.0),textAlign: TextAlign.center,),

           new Padding(padding: EdgeInsets.only(top: 24.0)),
           
           new IconButton(
               icon: new Image.network(_url),
               onPressed: _favoriser),
           
           new Padding(padding: EdgeInsets.only(top: 24.0)),

           new RaisedButton(onPressed:  null , child: new Text(_idole.topic),),

           new Padding(padding: EdgeInsets.only(top: 24.0)),

           new RaisedButton(onPressed:  null , child: new Text(_idole.hobit),),
         ],
         ),
       ),
     )
   ),
   );
  }
}