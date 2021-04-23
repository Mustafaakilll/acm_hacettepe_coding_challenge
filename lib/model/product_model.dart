import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  Product({this.products});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  List<Products> products;
}

@JsonSerializable()
class Products {
  Products(
      {this.productID,
      this.categoryID,
      this.unitPrice,
      this.unitsInStock,
      this.name,
      this.imageUrl,
      this.voteAverage});

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);

  int productID;
  int categoryID;
  int unitPrice;
  int unitsInStock;
  String name;
  String imageUrl;
  num voteAverage;
}
