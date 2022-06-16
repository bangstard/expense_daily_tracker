import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/model/donation_model.dart';

class FirestoreMakeDonation {
  final CollectionReference _donationCollection =
      FirebaseFirestore.instance.collection(('donation'));

  addDonationToFirestore(DonationModel donationModel) async {
    await _donationCollection
        .doc(donationModel.donationId)
        .set(donationModel.toJson());
  }

  Future<List<QueryDocumentSnapshot>> getDonationByUserFromFirestore(
      String donationid) async {
    var donation = await _donationCollection.get();
    return donation.docs;
  }

  Future<List<QueryDocumentSnapshot>> getDonationFromFirestore() async {
    var donation = await _donationCollection.get();
    return donation.docs;
  }
}
