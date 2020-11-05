import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {
  String id;
  String title;
  String category;
  String thumbnailUrl;
  String videoUrl;

  VideoModel(
      {this.id, this.title, this.category, this.thumbnailUrl, this.videoUrl});

  factory VideoModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot queryDocumentSnapshot) {
    return VideoModel(
      id: queryDocumentSnapshot.id,
      title: queryDocumentSnapshot.data()['title'],
      category: queryDocumentSnapshot.data()['category'],
      thumbnailUrl: queryDocumentSnapshot.data()['thumbnailUrl'],
      videoUrl: queryDocumentSnapshot.data()['videoUrl'],
    );
  }
}
