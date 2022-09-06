// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => new Products(
    id: json['id'] as String,
    title: json['title'] as String,
    precio: json['precio'] as String,
    description: json['description'] as String,
    category: json['category'] as String,
    images: json['images'] as String,
 

abstract class _$ProductsSerializerMixin {
  String get id;

  String get title;

  String get precio;

  String get description;

  String get category;

  String get images;



  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'precio': precio,
        'descripcion': descripcion,
        'category': category,
        'images': images,
      };
}