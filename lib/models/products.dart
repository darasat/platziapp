import 'package:platziapp/models/categories.dart';

class Products {
  int? id;
  String? title;
  int? price;
  String? description;
  Categories? category;
  List<String>? images;

  Products(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.images});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? new Categories.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['images'] = this.images;
    return data;
  }
}

Future<List<Products>> fromProductsJson(List<dynamic> json) async {
  List<Products> productList = List<Products>.empty(growable: true);
  for (var products in json) {
    productList.add(new Products(
        id: products["id"],
        title: products["title"],
        price: products["price"],
        description: products["description"],
        category: products['category'] != null
            ? new Categories.fromJson(products['category'])
            : null,
        images: products['images'].cast<String>()));
  }
  return productList;
}
