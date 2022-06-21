import 'package:flutter/material.dart';
import 'package:hearooz/auth/sign_up_screen.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../../auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              child: const Text(
                'Jetzt kostenlos registrieren, um deine Favoriten zu speichern!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
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
                      Navigator.push(
                          context,
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
              width: MediaQuery.of(context).size.width * 0.75,
              top: 270,
              left: 30,
              child: const Text(
                'Du bist bereits registrient?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFafa278),
                ),
              )),
          Positioned(
              width: 80,
              top: 270,
              right: 68,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 400),
                          transitionsBuilder: (BuildContext context, animation,
                              secAnimation, child) {
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
                child: const Text(
                  'Zum login!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF96906f),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
