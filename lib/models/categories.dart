class Categories {
  int? id;
  String? name;
  String? image;

  Categories({this.id, this.name, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

Future<List<Categories>> fromCategoriesJson(List<dynamic> json) async {
  List<Categories> categoriesList = List<Categories>.empty(growable: true);
  for (var categories in json) {
    categoriesList.add(new Categories(
      id: categories["id"],
      name: categories["name"],
      image: categories["image"],
    ));
  }
  return categoriesList;
}
