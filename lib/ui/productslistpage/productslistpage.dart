import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siddartha_task/bloc/products_bloc.dart';
import 'package:siddartha_task/bloc/products_event.dart';
import 'package:siddartha_task/bloc/products_state.dart';
import 'package:siddartha_task/repositry/apirepositryimpl.dart';
import 'package:siddartha_task/ui/productsdetailspage/productsdetailspage.dart';
import 'package:siddartha_task/ui/productslistpage/widgets/products_card.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  late ProductBloc _productBloc;
  @override
  void initState() {
    _productBloc = ProductBloc(ApiRepositryImpl());
    _productBloc.add(PageStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: _productBloc,
        builder: (context, state) {
          if (state is ProductErrorOccured) {
            return Center(child: Text(state.message));
          } else if (state is ProductLoaded) {
            return ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.products.length,
                itemBuilder: (context, index) => ProductsCard(
                      product: state.products[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(
                              product: state.products[index],
                            ),
                          ),
                        );
                      },
                    ));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
