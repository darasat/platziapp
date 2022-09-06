// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => new Categories(
    id: json['id'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
 

abstract class _$CategoriesSerializerMixin {
  String get id;

  String get name;

  String get image;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'image': image,
      };
}