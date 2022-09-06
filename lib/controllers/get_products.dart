import 'package:coffee/models/product_model.dart';
import 'package:flutter/material.dart';

class GetProducts {
  List<ProductModel> _list = [
    ProductModel(
      id: '0',
      title: 'Black Javanese',
      price: 15.2,
      description:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus repellat magnam ipsa sequi optio magni iste tenetur aperiam impedit maxime!',
      colors: [
        Color.fromARGB(255, 3, 136, 3),
        Color.fromARGB(255, 0, 245, 127)
      ],
      imageUrl: 'assets/images/coffee1.png',
    ),
    ProductModel(
      id: '1',
      title: 'Coffee 2',
      price: 65.2,
      description:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus repellat magnam ipsa sequi optio magni iste tenetur aperiam impedit maxime!',
      colors: [
        Color.fromARGB(255, 0, 48, 206),
        Color.fromARGB(255, 0, 127, 245)
      ],
      imageUrl: 'assets/images/coffee2.png',
    ),
    ProductModel(
      id: '2',
      title: 'Coffee 3',
      price: 165.2,
      description:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus repellat magnam ipsa sequi optio magni iste tenetur aperiam impedit maxime!',
      colors: [
        Color.fromARGB(255, 189, 85, 0),
        Color.fromARGB(255, 245, 159, 0)
      ],
      imageUrl: 'assets/images/coffee3.png',
    ),
    ProductModel(
      id: '3',
      title: 'Coffee 4',
      price: 277.2,
      description:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus repellat magnam ipsa sequi optio magni iste tenetur aperiam impedit maxime!',
      colors: [
        Color.fromARGB(255, 0, 48, 206),
        Color.fromARGB(255, 0, 127, 245)
      ],
      imageUrl: 'assets/images/coffee4.png',
    ),
    ProductModel(
      id: '4',
      title: 'Coffee 5',
      price: 874.2,
      description:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus repellat magnam ipsa sequi optio magni iste tenetur aperiam impedit maxime!',
      colors: [
        Color.fromARGB(255, 189, 85, 0),
        Color.fromARGB(255, 245, 159, 0)
      ],
      imageUrl: 'assets/images/coffee5.png',
    ),
  ];

  List<ProductModel> get list {
    return [..._list];
  }
}
