import 'package:flutter/material.dart';
import 'package:siddartha_task/model/products.dart';

import '../../../const/rating_bar/rating_bar.dart';

class ProductsCard extends StatelessWidget {
  final Product product;
  final Function onTap;
  const ProductsCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product.image != null)
                  Expanded(
                    flex: 1,
                    child: Image.network(
                      product.image!,
                      fit: BoxFit.contain,
                    ),
                  ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (product.title != null)
                            Text(
                              product.title!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          const SizedBox(
                            height: 5,
                          ),
                          if (product.rating != null &&
                              product.rating!.rate != null)
                            Row(
                              children: [
                                RatingBar.builder(
                                  itemSize: 18,
                                  initialRating: product.rating!.rate!,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.green,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                                if (product.rating!.count != null)
                                  Text("(${product.rating!.count!})")
                              ],
                            ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "₹${product.price}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          OutlinedButton(
                              onPressed: null, child: Text(product.category!))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
