import 'package:siddartha_task/model/products.dart';

abstract class ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
}

class ProductErrorOccured extends ProductState {
  final String message;
  ProductErrorOccured(this.message);
}

class ProductLoading extends ProductState {}
