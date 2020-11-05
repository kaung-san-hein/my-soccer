import 'package:cloud_firestore/cloud_firestore.dart';

class NewModel {
  String id;
  String title;
  String imageUrl;
  String description;

  NewModel({this.id, this.title, this.imageUrl, this.description});

  factory NewModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot queryDocumentSnapshot) {
    return NewModel(
      id: queryDocumentSnapshot.id,
      title: queryDocumentSnapshot.data()['title'],
      imageUrl: queryDocumentSnapshot.data()['imageUrl'],
      description: queryDocumentSnapshot.data()['description'],
    );
  }
}
