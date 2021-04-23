// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) {
  return Categories(
    categoryID: json['categoryID'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'categoryID': instance.categoryID,
      'name': instance.name,
    };
