import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/get_products.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  final product = GetProducts().findProductById(Get.arguments);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(product.title),
    );
  }
}
