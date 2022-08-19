import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePageLoading extends StatelessWidget {
  const HomePageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Preparing the best podcast experience for you!!',
            style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
          ),
          LottieBuilder.asset(
            'assets/man.json',
            height: 500,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
