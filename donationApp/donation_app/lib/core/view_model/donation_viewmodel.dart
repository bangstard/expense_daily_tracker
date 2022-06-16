import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/core/services/firestore_donation.dart';
import 'package:donation_app/core/services/local_storage_user.dart';
import 'package:donation_app/model/donation_model.dart';
import 'package:donation_app/model/user_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DonationViewModel extends GetxController {
  UserModel? _currentUser;

  final List<DonationModel> _donationListByUser = [];
  final List<DonationModel> _donationList = [];

  List<DonationModel> get donationListByUser => _donationListByUser;
  List<DonationModel> get donationList => _donationList;

  bool _loading = false;
  bool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    _getDonationListFromFirestore();
    getCurrentUser();
  }

  getCurrentUser() async {
    _loading = true;
    _currentUser = await LocalStorageUser.getUserData();
    _loading = false;
    update();
  }

  _getDonationListFromFirestore() async {
    _loading = true;
    List<QueryDocumentSnapshot> donationSnapshot =
        await FirestoreMakeDonation().getDonationFromFirestore();
    for (var donation in donationSnapshot) {
      _donationList
          .add(DonationModel.fromJson(donation.data() as Map<String, dynamic>));
    }
    _loading = false;
    update();
  }

  void addDonationToFirestore(DonationModel donationModel) async {
    // DonationModel _donationModel = DonationModel(donationId: '${_currentUser!.userId}' , title: title, description: description, category: category, target: target,)
  }
}
