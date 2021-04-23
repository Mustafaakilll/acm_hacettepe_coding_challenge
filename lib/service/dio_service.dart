import 'dart:io';

import 'package:dio/dio.dart';

import '../model/category_model.dart';
import '../model/product_model.dart';

class DioService {
  //NOTE: I AM USING PYHSICAL DEVICE FOR DEBUG SO I USE NGROK FOR CONNECT LOCALHOST
  Future getProducts() async {
    final _response = await Dio().get('https://06dd4a402fca.ngrok.io/products');
    if (_response.statusCode == HttpStatus.ok) {
      final _products = _response.data;
      return _products.map((product) => Products.fromJson(product)).toList();
    } else {
      throw Exception('ERROR ON GET PRODUCTS');
    }
  }

  //NOTE: I AM USING PYHSICAL DEVICE FOR DEBUG SO I USE NGROK FOR CONNECT LOCALHOST
  Future<List<dynamic>> getCategories() async {
    final response =
        await Dio().get('https://06dd4a402fca.ngrok.io/categories');
    if (response.statusCode == HttpStatus.ok) {
      final categories = response.data;
      return categories
          .map((category) => Categories.fromJson(category))
          .toList();
    } else {
      throw Exception('ERROR ON GET CATEGORIES');
    }
  }

  //NOTE: I AM USING PYHSICAL DEVICE FOR DEBUG SO I USE NGROK FOR CONNECT LOCALHOST
  Future getProductByCategoryId(int categoryId) async {
    final _response = await Dio()
        .get('https://06dd4a402fca.ngrok.io/products?categoryID=$categoryId');
    if (_response.statusCode == HttpStatus.ok) {
      final _products = _response.data;
      return _products.map((product) => Products.fromJson(product)).toList();
    } else {
      throw Exception('ERROR ON GET PRODUCTS BY CATEGORY');
    }
  }
}
