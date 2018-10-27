import 'package:firebase_database/firebase_database.dart';

class Activitie{
   String description;
   String start,end;

   Activitie(this.description, this.start, this.end);


   Activitie.fromSnapshot(DataSnapshot snap):
         description = snap.value["Desc"],
         start = snap.value["start"],
         end = snap.value["end"];

}