import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:siddartha_task/const/strings.dart';
import 'package:siddartha_task/repositry/apirepositry.dart';
import 'package:siddartha_task/service/apiservice.dart';

import '../model/products.dart';

class ApiRepositryImpl extends ApiRepositry {
  late ApiService _apiService;
  ApiRepositryImpl() {
    _apiService = ApiService();
  }
  @override
  Future<Either<List<Product>, String>> getData() async {
    try {
      final responseList = await _apiService.getData();
      return left(responseList);
    } on SocketException catch (_) {
      return right(Strings.SOCKET_EXCEPTION_MSG);
    } catch (_) {
      return right(Strings.GEN_EXCEPTION_MSG);
    }
  }
}
