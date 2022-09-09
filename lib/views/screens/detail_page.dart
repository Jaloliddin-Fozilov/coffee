import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/get_products.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  final product = GetProducts().findProductById(Get.arguments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: product.id + product.colors.toString(),
            child: AnimatedContainer(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: product.colors,
                ),
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            ),
          ),
          SizedBox(
            height: 80,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_basket_outlined),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 80),
                      Hero(
                        tag: product.id,
                        child: Image.asset(
                          width: 150,
                          product.imageUrl,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        product.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 240,
                child: Stack(
                  children: [
                    Positioned(
                      child: AnimatedContainer(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        height: 100,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: product.colors[0],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        duration: const Duration(seconds: 1),
                        child: const Text(
                          'About',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      child: AnimatedContainer(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        height: 100,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.brown[900],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        duration: const Duration(seconds: 1),
                        child: const Text(
                          'Ingredients',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      child: AnimatedContainer(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        height: 120,
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        duration: const Duration(seconds: 1),
                        child: const Text(
                          'Order',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
