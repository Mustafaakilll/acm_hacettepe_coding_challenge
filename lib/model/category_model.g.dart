// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    categories: (json['categories'] as List)
        ?.map((e) =>
            e == null ? null : Categories.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'categories': instance.categories,
    };

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
