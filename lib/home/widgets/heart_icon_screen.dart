import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hearooz/audio/services/service_locator.dart';
import 'package:hearooz/auth/login_screen.dart';
import 'package:hearooz/auth/sign_up_screen.dart';
import 'package:hearooz/providers/audio_manager_provider.dart';
import 'package:hearooz/providers/favorite_item_provider.dart';
import 'package:hearooz/providers/profile_screen_provider.dart';
import 'package:hearooz/providers/user_registration.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../audio/page_manager.dart';

class HeartIconScreen extends StatefulWidget {
  const HeartIconScreen({Key? key}) : super(key: key);

  @override
  State<HeartIconScreen> createState() => _HeartIconScreenState();
}

class _HeartIconScreenState extends State<HeartIconScreen> {
  var tappedIndex = -1;

  @override
  void initState() {
    super.initState();
    print('in here!@');
    Future.delayed(const Duration(milliseconds: 300), () {
      Provider.of<FavoriteItemProvider>(context, listen: false).read();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
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
        child: Consumer<FavoriteItemProvider>(builder: (context, data, child) {
          return Consumer<ProfileScreenProvider>(
              builder: (context, value, child) {
            return Column(
              mainAxisAlignment: value.isVerfied == true
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.spaceBetween,
              children: [
                value.isVerfied != true
                    ? Container(
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
                      )
                    : const SizedBox.shrink(),
                value.isVerfied == true
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 50,
                      ),
                value.isVerfied == true
                    ? data.list.isNotEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.66,
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: data.list.length,
                                      itemBuilder: ((context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 5.0),
                                          child: Consumer(builder:
                                              (context, authprovider, child) {
                                            return Consumer<
                                                    AudioManagerProvider>(
                                                builder:
                                                    (context, value, child) {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: GestureDetector(
                                                  onTap: (() async {
                                                    print(
                                                        'the data list is ${data.list}');
                                                    setState(() {
                                                      tappedIndex = index;
                                                    });
                                                    await value.setUpAudio(
                                                        data.list[index]['id']!,
                                                        data.list[index]
                                                            ['title']!,
                                                        data.list[index][
                                                                'cover_image'] ??
                                                            'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
                                                        context);

                                                    pageManager.stop();
                                                    pageManager.seek(
                                                        const Duration(
                                                            seconds: 0));
                                                    pageManager.remove();
                                                    pageManager.add(
                                                        value.audioFile,
                                                        value.title,
                                                        'Hearooz');
                                                    pageManager.play();
                                                  }),
                                                  child: Container(
                                                    color: tappedIndex == index
                                                        ? Colors.blue[300]
                                                        : Colors.transparent,
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: 100,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .25,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                child:
                                                                    FutureBuilder(
                                                                        future: getImgUrl(data.list[index]
                                                                            [
                                                                            'cover_image']),
                                                                        builder:
                                                                            (context,
                                                                                AsyncSnapshot snapshot) {
                                                                          bool
                                                                              error =
                                                                              snapshot.data == null;
                                                                          return SizedBox(
                                                                              child: !error ? Image.network(snapshot.data) : Image.asset('assets/app_icon.png'));
                                                                        }),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .7,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                data.list[index]
                                                                    ['title']!,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 18,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          35,
                                                                          35,
                                                                          35),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              Consumer<
                                                                      UserRegistrationProvider>(
                                                                  builder:
                                                                      (context,
                                                                          auth,
                                                                          child) {
                                                                return Consumer<
                                                                        FavoriteItemProvider>(
                                                                    builder: (context,
                                                                        value,
                                                                        child) {
                                                                  return auth.refreshToken !=
                                                                          ''
                                                                      ? IconButton(
                                                                          icon: Icon(value.list.contains(data.list[index]) == true
                                                                              ? CupertinoIcons.heart_fill
                                                                              : CupertinoIcons.heart),
                                                                          onPressed:
                                                                              () {
                                                                            print('the data is in delete ${data.list}');
                                                                            print('the user auth token is ${auth.refreshToken}');
                                                                            value.removeFromFavorite(
                                                                                auth.refreshToken,
                                                                                data.list[index],
                                                                                index);
                                                                          },
                                                                          iconSize:
                                                                              36,
                                                                          color:
                                                                              Colors.red,
                                                                        )
                                                                      : const SizedBox
                                                                          .shrink();
                                                                });
                                                              })
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                          }),
                                        );
                                      })),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.only(top: 150),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Your favorite will shown here',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontStyle: FontStyle.italic),
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
                                child: Text(
                                  'Jetzt kostenlos registrieren, um deine Favoriten zu speichern!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context)
                                                .textScaleFactor >=
                                            1
                                        ? 17
                                        : 21,
                                    color: const Color(0xFFafa278),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
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
                                                pageBuilder: ((context,
                                                    animation,
                                                    secondaryAnimation) {
                                                  return const SignUpScreen();
                                                })));
                                      },
                                      child: Text(
                                        'Kostenlos registrieren',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                        .textScaleFactor >=
                                                    1
                                                ? 14
                                                : 18,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ),
                              ),
                            ),
                            Positioned(
                                width: MediaQuery.of(context).size.width * 0.8,
                                top: 220,
                                left: MediaQuery.of(context).size.width * 0.2,
                                child: Row(
                                  children: [
                                    Text(
                                      'Du bist bereits registrient?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context)
                                                    .textScaleFactor >=
                                                1
                                            ? 14
                                            : 18,
                                        color: const Color(0xFFafa278),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    InkWell(
                                      onTap: () {
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
                                                pageBuilder: ((context,
                                                    animation,
                                                    secondaryAnimation) {
                                                  return const LoginScreen();
                                                })));
                                      },
                                      child: Text(
                                        'Zum login!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                      .textScaleFactor >=
                                                  1
                                              ? 14
                                              : 18,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF96906f),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      )
              ],
            );
          });
        }),
      ),
    );
  }
}
