import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class HeartIconScreen extends StatelessWidget {
  const HeartIconScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 150,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 180,
          ),
          Container(
            height: 420,
            child: WaveWidget(
              config: CustomConfig(
                colors: [const Color(0xffffef9a), Colors.blue],
                durations: [35000, 19440],
                heightPercentages: [0.20, 0.23],
              ),
              size: const Size(
                double.infinity,
                double.infinity,
              ),
            ),
          )
        ],
      ),
    );
  }
}
