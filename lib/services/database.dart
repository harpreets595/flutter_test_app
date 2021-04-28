import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/brew.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength
    });
  }

  // brew list form snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((e) {

    });

  }


  // get brews streams
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }


}