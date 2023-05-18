import 'package:dartz/dartz.dart';

import '../model/products.dart';

abstract class ApiRepositry {
  Future<Either<List<Product>, String>> getData();
}
