import 'package:flutter/material.dart';
import 'package:hearooz/home/main_header.dart';
import 'package:hearooz/utils/colors.dart';

class MainHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      body: Column(
        children: const [
          Header(),
        ],
      ),
    );
  }
}
