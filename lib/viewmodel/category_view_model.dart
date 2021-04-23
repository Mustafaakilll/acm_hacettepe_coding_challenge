import 'package:flutter/material.dart';

import '../service/dio_service.dart';

class CategoryViewModel with ChangeNotifier {
  final DioService _service = DioService();

  bool isLoading = false;

  final _categories = [];
  List get categories => _categories;

  void getAllCategories() async {
    isLoading = true;
    final categories = await _service.getCategories();
    _categories.addAll(categories);
    isLoading = false;
    notifyListeners();
  }
}
