import 'package:flutter/material.dart';
import 'package:justhabit/Model/User.dart';
import 'package:justhabit/widgets/home/MyActivities.dart';
import 'package:justhabit/widgets/home/Search.dart';




class home extends StatelessWidget{
  User member;
  home(this.member);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new DefaultTabController(length: 4,
        child: new Scaffold(
      appBar: new AppBar(
        title: new Text("Home" , textDirection: TextDirection.ltr,),
        bottom: new TabBar(tabs: <Tab>[
          new Tab(icon: new Icon(Icons.account_circle)),
          new Tab(icon: new Icon(Icons.grade)),
          new Tab(icon: new Icon(Icons.search)),
          new Tab(icon: new Icon(Icons.access_time)),
        ],
        ),
      ),
      body: new TabBarView( children: [
        new MyActivities(member),
        Icon(Icons.directions_transit),
        new Search(member),
        Icon(Icons.directions_bike),
      ],),

    ),
    ),
    );


  }

}