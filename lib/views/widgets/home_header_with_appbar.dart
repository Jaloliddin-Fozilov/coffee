import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee/models/product_model.dart';
import 'package:get/get.dart';
import '../../controllers/get_products.dart';

class HomeHeaderWithAppBar extends StatefulWidget {
  HomeHeaderWithAppBar({Key? key}) : super(key: key);

  @override
  State<HomeHeaderWithAppBar> createState() => _HomeHeaderWithAppBarState();
}

class _HomeHeaderWithAppBarState extends State<HomeHeaderWithAppBar> {
  final products = GetProducts().list;

  late List<Color> activeColors = products[0].colors;

  late String currentProductId = products[0].id;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(180),
              bottomRight: Radius.circular(180),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: activeColors,
            ),
          ),
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        ),
        SizedBox(
          height: 80,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.format_align_left),
            ),
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
          children: [
            const SizedBox(height: 100),
            CarouselSlider(
              items: products.map(
                (product) {
                  return GestureDetector(
                    onTap: () {
                      if (currentProductId == product.id) {
                        Get.toNamed('/detail', arguments: product.id);
                      }
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 180,
                          child: Image.asset(product.imageUrl),
                        ),
                        currentProductId == product.id
                            ? Column(
                                children: [
                                  const SizedBox(height: 10),
                                  Text(
                                    product.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: product.colors[0],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '\$${product.price}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                height: 270.0,
                initialPage: 0,
                viewportFraction: 0.5,
                enlargeCenterPage: true,
                onPageChanged: (position, reason) {
                  setState(() {
                    activeColors = products[position].colors;
                    currentProductId = products[position].id;
                  });
                },
                enableInfiniteScroll: true,
              ),
            ),
          ],
        )
      ],
    );
  }
}
