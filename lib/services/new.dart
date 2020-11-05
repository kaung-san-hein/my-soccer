import 'package:cloud_firestore/cloud_firestore.dart';

class NewService {
  static CollectionReference _reference =
      FirebaseFirestore.instance.collection('news');

  static Stream<QuerySnapshot> getNews() {
    return _reference.orderBy('created', descending: true).snapshots();
  }

  static Stream<QuerySnapshot> getLatestNew() {
    return _reference
        .orderBy('created', descending: false)
        .limitToLast(1)
        .snapshots();
  }
}
