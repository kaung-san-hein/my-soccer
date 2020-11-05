import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_soccer/models/video.dart';

class VideoService {
  static CollectionReference _reference =
      FirebaseFirestore.instance.collection('videos');

  static Stream<QuerySnapshot> getVideos({String category}) {
    return _reference
        .where('category', isEqualTo: category)
        .orderBy('created', descending: true)
        .snapshots();
  }

  static Stream<List<VideoModel>> getVideosForSearch() {
    return _reference.orderBy('created', descending: true).snapshots().map(
        (event) => event.docs
            .map((e) => VideoModel.fromQueryDocumentSnapshot(e))
            .toList());
  }
}
