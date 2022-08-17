import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hearooz/utils/colors.dart';
import 'home/main_home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double height = 150;
  double width = 150;

  late AnimationController _splashScreenController;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // setheight();
    super.initState();

    _splashScreenController = AnimationController(
        vsync: this,
        lowerBound: 80,
        upperBound: 150,
        duration: const Duration(seconds: 1))
      ..addListener(() {
        setState(() {
          height = _splashScreenController.value;
          width = _splashScreenController.value;
        });
      })
      ..forward().whenCompleteOrCancel(() {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainHomePage()));
      });
  }

  // void setheight() {
  //   Future.delayed(const Duration(milliseconds: 100), () {
  //     setState(() {
  //       height = 80;
  //       width = 80;
  //     });
  //     Future.delayed(const Duration(milliseconds: 700), () {
  //       Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: (context) => const MainHomePage()));
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.yellowSplashColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: height,
                width: width,
                child: Image.asset(
                  'assets/ic_launcher_foreground.png',
                ),
              ),
            ),
            const GradientText(
              'HEAROOZ',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 178, 123, 46),
                  Color(0xffe87d39),
                  Color.fromARGB(255, 245, 190, 9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'HELDEN HOREN HIER',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ));
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTRB(0, 40, bounds.width, 16),
      ),
      child: Text(text, style: style),
    );
  }
}
