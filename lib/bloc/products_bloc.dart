import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siddartha_task/bloc/products_event.dart';
import 'package:siddartha_task/bloc/products_state.dart';
import 'package:siddartha_task/repositry/apirepositry.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiRepositry apiRepositry;
  ProductBloc(this.apiRepositry) : super(ProductLoading()) {
    on((event, emit) async {
      if (event is PageStarted) {
        final either = await apiRepositry.getData();
        either.fold(
          (products) {
            emit(ProductLoaded(products));
          },
          (errorMessage) {
            emit(ProductErrorOccured(errorMessage));
          },
        );
      }
    });
  }
}
