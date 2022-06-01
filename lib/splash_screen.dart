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
  late AnimationController _homeAnimationController;
  late Animation _homeAnimation;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _homeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 80));
    _homeAnimation = Tween(begin: 150.0, end: 80.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _homeAnimationController));
    _homeAnimationController.forward();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => MainHomePage()));
    });
    super.initState();
  }

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
                height: _homeAnimation.value,
                width: _homeAnimation.value,
                duration: const Duration(seconds: 2),
                child: Image.asset(
                  'assets/chimp.png',
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
