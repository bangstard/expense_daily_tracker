import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/model/affected_area.dart';
import 'package:donation_app/model/category.dart';
import 'package:get/get.dart';

import '../services/firestore_home.dart';

class HomeViewModel extends GetxController {
  final List<AreaModel> _affectedArea = [];
  final List<CategoryModel> _category = [];

  List<AreaModel> get affectedArea => _affectedArea;

  List<CategoryModel> get category => _category;

  bool _loading = false;

  bool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    _getAreaFromFireStore();
    _getCategoryFromFireStore();
  }

  _getAreaFromFireStore() async {
    _loading = true;
    List<QueryDocumentSnapshot> affectedAreaSnapshot =
        await FirestoreHome().getAffectedAreaFromFirestore();
    for (var area in affectedAreaSnapshot) {
      _affectedArea
          .add(AreaModel.fromJson(area.data() as Map<String, dynamic>));
    }
    _loading = false;
    update();
  }

  _getCategoryFromFireStore() async {
    _loading = true;
    List<QueryDocumentSnapshot> categorySnapshot =
        await FirestoreHome().getCategoryFromFirestore();
    for (var category in categorySnapshot) {
      _category
          .add(CategoryModel.fromJson(category.data() as Map<String, dynamic>));
    }
    _loading = false;
    update();
  }
}
