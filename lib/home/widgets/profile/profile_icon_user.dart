import 'package:flutter/material.dart';
import 'package:hearooz/providers/user_registration.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/link.dart';

class ProfileScreenUser extends StatelessWidget {
  const ProfileScreenUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 200,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 350,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      'assets/ic_launcher_foreground.png',
                      height: 180,
                      width: 180,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 15.0),
                    child: Text(
                      'Hearoo 1',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Consumer<UserRegistrationProvider>(
                builder: (context, value, child) {
              return Container(
                  height: 200,
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Link(
                            uri: Uri.parse(
                                'https://www.hearooz.de/app/login?handover=${value.refreshToken}&target=user'),
                            builder:
                                (context, Future<void> Function()? followLink) {
                              return TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xFF4a95fa))),
                                  onPressed: followLink,
                                  child: const Text(
                                    'Profile bearbeiten',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ));
                            }),
                      )));
            })
          ],
        ),
      ),
    );
  }
}
