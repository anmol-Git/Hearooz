import 'package:flutter/material.dart';
import 'package:hearooz/audio/services/service_locator.dart';
import 'package:hearooz/providers/api_registration_provider.dart';
import 'package:hearooz/providers/profile_screen_provider.dart';
import 'package:hearooz/providers/user_registration.dart';
import 'package:hearooz/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  await setupServiceLocator();
  runApp(const MyApp());
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
