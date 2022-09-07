import 'package:coffee/views/widgets/home_header_with_appbar.dart';
import 'package:coffee/views/widgets/second_block.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeHeaderWithAppBar(),
          const SecondBlock(),
        ],
      ),
    );
  }
}
