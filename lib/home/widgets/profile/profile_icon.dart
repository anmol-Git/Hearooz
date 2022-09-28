import 'package:flutter/material.dart';
import 'package:hearooz/auth/sign_up_screen.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../../auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      print('text size ${MediaQuery.of(context).textScaleFactor}');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[700],
      height: 420,
      child: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              colors: [const Color(0xffffef9a)],
              durations: [35000],
              heightPercentages: [0.002],
            ),
            size: const Size(
              double.infinity,
              double.infinity,
            ),
          ),
          Positioned(
              width: MediaQuery.of(context).size.width * 0.8,
              top: 130,
              left: 40,
              child: Text(
                'Jetzt kostenlos registrieren, um deine Favoriten zu speichern!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).textScaleFactor >= 1 ? 17 : 21,
                  color: Color(0xFFafa278),
                ),
              )),
          Positioned(
            top: 190,
            left: 40,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF4a95fa))),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                          PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                              transitionsBuilder: (BuildContext context,
                                  animation, secAnimation, child) {
                                animation = CurvedAnimation(
                                    parent: animation, curve: Curves.bounceIn);

                                return ScaleTransition(
                                  scale: animation,
                                  alignment: Alignment.bottomCenter,
                                  child: child,
                                );
                              },
                              pageBuilder:
                                  ((context, animation, secondaryAnimation) {
                                return const SignUpScreen();
                              })));
                    },
                    child: const Text(
                      'Kostenlos registrieren',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    )),
              ),
            ),
          ),
          Positioned(
              width: MediaQuery.of(context).size.width * 0.8,
              top: 270,
              left: MediaQuery.of(context).size.width * 0.20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Du bist bereits registrient?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).textScaleFactor >= 1 ? 14 : 18,
                      color: const Color(0xFFafa278),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                          PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                              transitionsBuilder: (BuildContext context,
                                  animation, secAnimation, child) {
                                animation = CurvedAnimation(
                                    parent: animation, curve: Curves.bounceIn);

                                return ScaleTransition(
                                  scale: animation,
                                  alignment: Alignment.bottomCenter,
                                  child: child,
                                );
                              },
                              pageBuilder:
                                  ((context, animation, secondaryAnimation) {
                                return const LoginScreen();
                              })));
                    },
                    child: Text(
                      'Zum login!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor >= 1
                            ? 14
                            : 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF96906f),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
