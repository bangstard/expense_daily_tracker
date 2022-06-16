class AreaModel {
  late String area, image, category, description;

  AreaModel({
    required this.area,
    required this.image,
    required this.category,
    required this.description,
  });

  AreaModel.fromJson(Map<dynamic, dynamic> map) {
    area = map['area'];
    image = map['image'];
    category = map['category'];
    description = map['description'];
  }

  toJson() {
    return {
      'area': area,
      'image': image,
      'category': category,
      'descriptio': description,
    };
  }
}
