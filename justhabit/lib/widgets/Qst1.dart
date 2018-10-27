import 'package:flutter/material.dart';
import 'package:justhabit/Model/User.dart';
import 'package:justhabit/widgets/Qst2.dart';
import 'package:firebase_database/firebase_database.dart';

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
        MaterialPageRoute(builder: (context) => new qst2(userGlobale)),
      );
    }
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("JustHobbit"),
      ),
     backgroundColor: Colors.black,
      body: new Center(
        child: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("images/background.PNG"), fit: BoxFit.cover,),
          ),
          child: new Padding(padding: EdgeInsets.only(top: 70.0,left: 24.0,right: 24.0),
            child:new Column(
              children: <Widget>[
                new Text(" Just do it!" , style: new TextStyle(color: Colors.white , fontSize: 21.0) ,),
                new Text(" Let we know about what interest you" , style: new TextStyle(color: Colors.white , fontSize: 21.0) ,),
                new Padding(padding: EdgeInsets.only(top: 18.0)),
                new Padding(padding: EdgeInsets.only(left: 8.0)),

                new RaisedButton(onPressed: () => chose("Sport") ,
                    elevation: 10.0,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                    color: const Color(0xFF4348a5),
                    padding: EdgeInsets.only(top: 6.0,bottom: 6.0),
                  child: new Row(
                    children: <Widget>[
                      new Padding(padding: EdgeInsets.only(left: 126.0)),
                      new Text("Sport" , style: new TextStyle(fontSize: 18.0 ,fontFamily: "Palatino",color: Colors.white), ),
                      new Padding(padding: EdgeInsets.only(left: 50.0)),
                      new Image.asset("images/strong.png", width: 46.0 , height: 46.0,),
                    ],
                  )
                  ),

                new Padding(padding: EdgeInsets.only(top: 24.0)),

                new RaisedButton(onPressed: () => chose("Literator") ,
                    elevation: 10.0,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                    color: const Color(0xFFdedd40),
                    padding: EdgeInsets.only(top: 6.0,bottom: 6.0),
                  child: new Row(
                    children: <Widget>[
                      new Padding(padding: EdgeInsets.only(left: 126.0)),
                      new Text("Literator" , style: new TextStyle(fontSize: 18.0 ,fontFamily: "Palatino",color: Colors.white), ),
                        new Padding(padding: EdgeInsets.only(left: 20.0)),
                      new Image.asset("images/open-book.png", width: 46.0 , height: 46.0,),
                    ],
                  )
                  ),

                new Padding(padding: EdgeInsets.only(top: 24.0)),

                new RaisedButton(onPressed: () => chose("Music") ,
                    elevation: 10.0,
                    color: const Color(0xFFf78e29),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                    padding: EdgeInsets.only(top: 6.0,bottom: 6.0),
                    child: new Row(
                      children: <Widget>[
                        new Padding(padding: EdgeInsets.only(left: 126.0)),
                        new Text("Music" , style: new TextStyle(fontSize: 18.0 ,fontFamily: "Palatino",color: Colors.white), ),
                        new Padding(padding: EdgeInsets.only(left: 40.0)),
                        new Image.asset("images/musical-note.png", width: 46.0 , height: 46.0,),
                      ],
                    )
                ),

                new Padding(padding: EdgeInsets.only(top: 24.0)),

                new RaisedButton(onPressed: () => chose("Film") ,
                    elevation: 10.0,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                    color: const Color(0xFFff2f16),
                    padding: EdgeInsets.only(top: 6.0,bottom: 6.0),
                    child: new Row(
                      children: <Widget>[
                        new Padding(padding: EdgeInsets.only(left: 126.0)),
                        new Text("Film" , style: new TextStyle(fontSize: 18.0 ,fontFamily: "Palatino",color: Colors.white), ),
                        new Padding(padding: EdgeInsets.only(left: 60.0)),
                        new Image.asset("images/video.png", width: 46.0 , height: 46.0,),
                      ],
                    )
                ),

              ],
            ),
          )
          ,)
      ),
    );
  }


}