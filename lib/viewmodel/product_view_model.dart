import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../service/dio_service.dart';

class ProductViewModel with ChangeNotifier {
  final DioService _service = DioService();

  bool isLoading = false;

  int cartSum = 0;

  final _products = [];
  List<dynamic> get products => _products;

  final _addedProductToFavorite = [];
  List<dynamic> get favoritedProduct => _addedProductToFavorite;

  final _addedProductToCart = [];
  List<dynamic> get addedProductToCart => _addedProductToCart;

  void getAllProducts() async {
    isLoading = true;
    final products = await _service.getProducts();
    _products.addAll(products);
    isLoading = false;
    notifyListeners();
  }

  void getProductsByCategoryId(int categoryId) async {
    isLoading = true;
    final products = await _service.getProductByCategoryId(categoryId);
    _products.addAll(products);
    isLoading = false;
    notifyListeners();
  }

  void addToFavorite(Products product) {
    _addedProductToFavorite.add(product);
    notifyListeners();
  }

  void removeFromFavorite(Products product) {
    _addedProductToFavorite.remove(product);
    notifyListeners();
  }

  void addToCart(Products product) {
    _addedProductToCart.add(product);
    calculateCartSum();
    notifyListeners();
  }

  void removeFromCart(Products product) {
    _addedProductToCart.remove(product);
    calculateCartSum();
    notifyListeners();
  }

  void calculateCartSum() {
    for (final cartProduct in _addedProductToCart) {
      cartSum += cartProduct.unitPrice;
      notifyListeners();
    }
    notifyListeners();
  }
}
