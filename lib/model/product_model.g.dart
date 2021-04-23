// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) {
  return Products(
    productID: json['productID'] as int,
    categoryID: json['categoryID'] as int,
    unitPrice: json['unitPrice'] as int,
    unitsInStock: json['unitsInStock'] as int,
    name: json['name'] as String,
    imageUrl: json['imageUrl'] as String,
    voteAverage: json['vote_average'] as num,
  );
}

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'productID': instance.productID,
      'categoryID': instance.categoryID,
      'unitPrice': instance.unitPrice,
      'unitsInStock': instance.unitsInStock,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'voteAverage': instance.voteAverage,
    };
