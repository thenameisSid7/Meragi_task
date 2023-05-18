import 'package:flutter/material.dart';
import 'package:siddartha_task/model/products.dart';

import '../../const/rating_bar/rating_bar.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
                aspectRatio: 1.5, child: Image.network(widget.product.image!)),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.product.title!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.product.description!,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                RatingBar.builder(
                  itemSize: 18,
                  initialRating: widget.product.rating!.rate!,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.green,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                if (widget.product.rating!.count != null)
                  Text("(${widget.product.rating!.count!})")
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
                onPressed: null, child: Text(widget.product.category!))
          ],
        ),
      ),
    );
  }
}
