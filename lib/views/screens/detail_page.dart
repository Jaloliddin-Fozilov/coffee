import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_state_button/multi_state_button.dart';
import '../../controllers/get_products.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key});

  static const String _submit = "Add to order";
  static const String _success = "Added";

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final product = GetProducts().findProductById(Get.arguments);

  bool aboutIsOpen = false;
  bool addToCartIsOpen = true;

  int quantity = 0;

  final MultiStateButtonController multiStateButtonController =
      MultiStateButtonController(initialStateName: DetailPage._submit);

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
                mainAxisAlignment: aboutIsOpen
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  aboutIsOpen
                      ? Column(
                          children: [
                            const SizedBox(height: 80),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 30),
                                Hero(
                                  tag: product.id,
                                  child: Image.asset(
                                    height: 80,
                                    product.imageUrl,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      : Column(
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
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: aboutIsOpen
                    ? 455
                    : addToCartIsOpen
                        ? 260
                        : 185,
                child: Stack(
                  children: [
                    Positioned(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            aboutIsOpen = !aboutIsOpen;
                            addToCartIsOpen = false;
                          });
                        },
                        child: AnimatedContainer(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          height: 380,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: product.colors[0],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          duration: const Duration(seconds: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'About',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              aboutIsOpen
                                  ? Text(
                                      product.description,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: aboutIsOpen ? 330 : 60,
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
                      top: aboutIsOpen ? 390 : 120,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            addToCartIsOpen = !addToCartIsOpen;
                          });
                        },
                        child: AnimatedContainer(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          height: addToCartIsOpen ? 220 : 100,
                          width: Get.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          duration: const Duration(seconds: 1),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Order',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            quantity--;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                          size: 36,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        quantity.toString(),
                                        style: const TextStyle(fontSize: 30),
                                      ),
                                      const SizedBox(width: 10),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                          size: 36,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              addToCartIsOpen
                                  ? const Divider(height: 10)
                                  : const SizedBox(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MultiStateButton(
                                    multiStateButtonController:
                                        multiStateButtonController,
                                    buttonStates: [
                                      ButtonState(
                                        stateName: DetailPage._submit,
                                        child: const Text(
                                          DetailPage._submit,
                                        ),
                                        textStyle: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                        size: const Size(140, 48),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: product.colors,
                                          ),
                                        ),
                                        onPressed: () =>
                                            multiStateButtonController
                                                    .setButtonState =
                                                DetailPage._success,
                                      ),
                                      ButtonState(
                                        stateName: DetailPage._success,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              DetailPage._success,
                                            ),
                                            SizedBox(
                                              width: 14,
                                            ),
                                            Icon(
                                              Icons
                                                  .check_circle_outline_outlined,
                                              color: Colors.white,
                                              size: 19,
                                            )
                                          ],
                                        ),
                                        textStyle: const TextStyle(
                                            color: Colors.white, fontSize: 19),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color.fromARGB(255, 2, 206, 9),
                                              Color.fromARGB(255, 121, 234, 127)
                                            ],
                                          ),
                                        ),
                                        size: const Size(150, 48),
                                        onPressed: () =>
                                            multiStateButtonController
                                                    .setButtonState =
                                                DetailPage._submit,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$${(product.price * quantity).toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 22,
                                    ),
                                  )
                                ],
                              ),
                            ],
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
