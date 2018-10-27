import 'package:firebase_database/firebase_database.dart';
import 'package:justhabit/Model/Activitie.dart';

class Idole{
  String photo,fullName,description,hobit,topic;
  List<Activitie> activities;

  Idole(this.photo, this.fullName, this.description, this.hobit, this.topic,
      this.activities);


  Idole.fromSnapshot(DataSnapshot snap):
      photo = snap.value["photo"],
      fullName = snap.value["Nom"],
      description = snap.value["Description"],
      hobit = snap.value["habit"],
      topic = snap.value["Topic"]
  ;

  void addAct(DataSnapshot snap){
    activities.add(new Activitie(snap.value["Activities"][0]["description"], snap.value["Activities"][0]["start"], snap.value["Activities"][0]["end"]));
  }
  toJson(){
    return{
     "photo" : photo,
      "fullName" : fullName,
      "description" : description,
      "hobit" : hobit,
      "topic" : topic
    };
  }

}