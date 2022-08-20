import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hearooz/auth/login_screen.dart';
import 'package:hearooz/auth/sign_up_screen.dart';
import 'package:hearooz/providers/api_registration_provider.dart';
import 'package:hearooz/providers/profile_screen_provider.dart';
import 'package:hearooz/providers/user_registration.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class HeartIconScreen extends StatelessWidget {
  const HeartIconScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<String?> getImgUrl(String? imgUrl) async {
      if (imgUrl != null) {
        try {
          Uint8List bytes =
              (await NetworkAssetBundle(Uri.parse(imgUrl)).load(imgUrl))
                  .buffer
                  .asUint8List();
          print("The image exists!");
          return imgUrl;
        } catch (e) {
          print("Error: $e");
          return null;
        }
      } else
        return null;
    }

    return Scaffold(
      body: Container(
        color: Colors.white,
        child:
            Consumer<ProfileScreenProvider>(builder: (context, value, child) {
          return Column(
            mainAxisAlignment: value.isVerfied == true
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                color: Colors.blue,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'DEINE \nPODCAST LISTE',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(
                          'assets/ic_launcher_foreground.png',
                          width: 100,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      )
                    ]),
              ),
              value.isVerfied == true
                  ? const SizedBox.shrink()
                  : const SizedBox(
                      height: 50,
                    ),
              value.isVerfied == true
                  // ? SizedBox(
                  //     height: 0,
                  //     child: FutureBuilder(
                  //         future: Provider.of<ApiRegistrationProvider>(context)
                  //             .favoriteItem(
                  //                 'Bearer ${Provider.of<UserRegistrationProvider>(context).refreshToken}'),
                  //         builder: (context, AsyncSnapshot snapshot) {
                  //           List<dynamic>? list = snapshot.data;
                  //           if () {
                  //             return ListView.builder(
                  //               itemCount: 10,
                  //               itemBuilder: (context, index) {
                  //                 return ClipRRect(
                  //                   borderRadius: BorderRadius.circular(10),
                  //                   child: SizedBox(
                  //                     height: 150,
                  //                     child: Row(
                  //                       children: [
                  //                         ClipRRect(
                  //                           borderRadius:
                  //                               BorderRadius.circular(10),
                  //                           child: SizedBox(
                  //                             height: 100,
                  //                             width: MediaQuery.of(context)
                  //                                     .size
                  //                                     .width *
                  //                                 0.25,
                  //                             child: FutureBuilder(
                  //                                 future: getImgUrl(list[index]
                  //                                     ['data']['cover_image']),
                  //                                 builder: (context,
                  //                                     AsyncSnapshot snapshot) {
                  //                                   bool error =
                  //                                       snapshot.data == null;
                  //                                   return SizedBox(
                  //                                       child: !error
                  //                                           ? Image.network(
                  //                                               snapshot.data)
                  //                                           : Image.asset(
                  //                                               'assets/app_icon.png'));
                  //                                 }),
                  //                           ),
                  //                         ),
                  //                         const SizedBox(
                  //                           width: 10,
                  //                         ),
                  //                         SizedBox(
                  //                           width: MediaQuery.of(context)
                  //                                   .size
                  //                                   .width *
                  //                               .7,
                  //                           child: Text(
                  //                             snapshot.data[index]['data']
                  //                                     ['title'] ??
                  //                                 '',
                  //                             style: const TextStyle(
                  //                               fontSize: 18,
                  //                               color: Color.fromARGB(
                  //                                   255, 35, 35, 35),
                  //                               fontWeight: FontWeight.w500,
                  //                             ),
                  //                             textAlign: TextAlign.left,
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 );
                  //               },
                  //             );
                  //           } else {
                  //             return const CircularProgressIndicator();
                  //           }
                  //         }),
                  //   )
                  ? Container(
                      margin: const EdgeInsets.only(top: 150),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Your favorite will shown here',
                              style: TextStyle(
                                  fontSize: 22, fontStyle: FontStyle.italic),
                            ),
                            LottieBuilder.asset(
                              'assets/fav.json',
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 320,
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
                              top: 80,
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
                            top: 140,
                            left: 40,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              child: SizedBox(
                                height: 60,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color(0xFF4a95fa))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              transitionDuration:
                                                  const Duration(
                                                      milliseconds: 400),
                                              transitionsBuilder:
                                                  (BuildContext context,
                                                      animation,
                                                      secAnimation,
                                                      child) {
                                                animation = CurvedAnimation(
                                                    parent: animation,
                                                    curve: Curves.bounceIn);

                                                return ScaleTransition(
                                                  scale: animation,
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: child,
                                                );
                                              },
                                              pageBuilder: ((context, animation,
                                                  secondaryAnimation) {
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
                              top: 220,
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
                              top: 220,
                              right: 68,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration:
                                              const Duration(milliseconds: 400),
                                          transitionsBuilder:
                                              (BuildContext context, animation,
                                                  secAnimation, child) {
                                            animation = CurvedAnimation(
                                                parent: animation,
                                                curve: Curves.bounceIn);

                                            return ScaleTransition(
                                              scale: animation,
                                              alignment: Alignment.bottomCenter,
                                              child: child,
                                            );
                                          },
                                          pageBuilder: ((context, animation,
                                              secondaryAnimation) {
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
                    )
            ],
          );
        }),
      ),
    );
  }
}
