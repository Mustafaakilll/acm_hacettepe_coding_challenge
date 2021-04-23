import 'dart:io';

import '../model/category_model.dart';
import '../model/product_model.dart';
import 'i_dio_service.dart';

class DioService extends IDioService {
  @override
  Future<List<dynamic>> getProducts() async {
    final _response = await dio.get('http://localhost:3000/products');
    if (_response.statusCode == HttpStatus.ok) {
      final _products = _response.data;
      return _products.map((product) => Products.fromJson(product)).toList();
    } else {
      throw Exception('ERROR ON GET PRODUCTS');
    }
  }

  @override
  Future<List<dynamic>> getCategories() async {
    final response = await dio.get('http://localhost:3000/categories');
    if (response.statusCode == HttpStatus.ok) {
      final categories = response.data;
      return categories
          .map((category) => Categories.fromJson(category))
          .toList();
    } else {
      throw Exception('ERROR ON GET CATEGORIES');
    }
  }

  @override
  Future<List<dynamic>> getProductByCategoryId(int categoryId) async {
    final _response =
        await dio.get('http://localhost:3000/products?categoryID=$categoryId');
    if (_response.statusCode == HttpStatus.ok) {
      final _products = _response.data;
      return _products.map((product) => Products.fromJson(product)).toList();
    } else {
      throw Exception('ERROR ON GET PRODUCTS BY CATEGORY');
    }
  }
}
