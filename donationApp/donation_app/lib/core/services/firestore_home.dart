import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHome {
  final CollectionReference _areaCollection =
      FirebaseFirestore.instance.collection("affectedArea");

  final CollectionReference _categoryCollection =
      FirebaseFirestore.instance.collection('category');

  Future<List<QueryDocumentSnapshot>> getAffectedAreaFromFirestore() async {
    var affectedArea = await _areaCollection.get();
    return affectedArea.docs;
  }

  Future<List<QueryDocumentSnapshot>> getCategoryFromFirestore() async {
    var category = await _categoryCollection.get();
    return category.docs;
  }
}
