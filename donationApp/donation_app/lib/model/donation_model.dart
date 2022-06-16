class DonationModel {
  late String donationId, title, description, category, target;

  DonationModel({
    required this.donationId,
    required this.title,
    required this.description,
    required this.category,
    required this.target,
  });

  DonationModel.fromJson(Map<dynamic, dynamic> map) {
    donationId = map['donationId'];
    title = map['title'];
    description = map['description'];
    category = map['category'];
    target = map['target'];
  }

  toJson() {
    return {
      'donationId': donationId,
      'title': title,
      'description': description,
      'category': category,
      'target': target,
    };
  }
}
