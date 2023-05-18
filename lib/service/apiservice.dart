import 'package:dio/dio.dart';
import 'package:siddartha_task/const/strings.dart';

import '../model/products.dart';

class ApiService {
  late Dio _dio;
  ApiService() {
    _dio = Dio();
  }
  Future<List<Product>> getData() async {
    final response = await _dio.get(Strings.API_URL);
    final list = response.data as List;
    return list.map((e) => Product.fromJson(e)).toList();
  }
}
