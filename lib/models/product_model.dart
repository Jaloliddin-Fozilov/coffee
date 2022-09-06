import 'package:flutter/material.dart';

class ProductModel {
  final String id;
  final String title;
  final double price;
  final String description;
  final List<Color> colors;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.colors,
    required this.imageUrl,
  });
}
