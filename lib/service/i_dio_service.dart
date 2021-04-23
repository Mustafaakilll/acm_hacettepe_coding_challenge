import 'package:dio/dio.dart';

abstract class IDioService {
  final Dio dio = Dio();

  Future<List<dynamic>> getProducts();

  Future<List<dynamic>> getCategories();

  Future<List<dynamic>> getProductByCategoryId(int categoryId);
}
