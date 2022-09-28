import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hearooz/audio/services/service_locator.dart';
import 'package:hearooz/providers/api_registration_provider.dart';
import 'package:hearooz/providers/audio_manager_provider.dart';
import 'package:hearooz/providers/catalog_retrieval_provider.dart';
import 'package:hearooz/providers/favorite_item_provider.dart';
import 'package:hearooz/providers/profile_screen_provider.dart';
import 'package:hearooz/providers/user_registration.dart';
import 'package:hearooz/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  await setupServiceLocator();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfileScreenProvider>(
          create: (context) => ProfileScreenProvider(),
        ),
        ChangeNotifierProvider<UserRegistrationProvider>(
          create: (context) => UserRegistrationProvider(),
        ),
        ChangeNotifierProvider<ApiRegistrationProvider>(
          create: (context) => ApiRegistrationProvider(),
        ),
        ChangeNotifierProvider<CatalogueRetrivalProvider>(
          create: (context) => CatalogueRetrivalProvider(),
        ),
        ChangeNotifierProvider<AudioManagerProvider>(
          create: ((context) => AudioManagerProvider()),
        ),
        ChangeNotifierProvider<FavoriteItemProvider>(
          create: ((context) => FavoriteItemProvider()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
