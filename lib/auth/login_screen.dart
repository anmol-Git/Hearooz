import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hearooz/auth/otp_validation_screen.dart';
import 'package:hearooz/auth/sign_up_screen.dart';
import 'package:hearooz/providers/api_registration_provider.dart';
import 'package:hearooz/providers/user_registration.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final myController = TextEditingController();
  late final UserRegistrationProvider userRegisterProvider;
  bool isValid = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      userRegisterProvider =
          Provider.of<UserRegistrationProvider>(context, listen: false);
    });
    super.initState();
  }

  void isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);
    isValid = regExp.hasMatch(em);
    setState(() {});
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color greyColor = const Color(0xff4c504f);
    Color lightGreyColor = const Color(0xff8b8c90);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        child: IconButton(
                          onPressed: () => {Navigator.pop(context)},
                          icon: Icon(CupertinoIcons.xmark,
                              color: greyColor, size: 28.0),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(right: 20),
                      ),
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: TextFormField(
                        controller: myController,
                        onChanged: (val) => {isEmail(val)},
                        textAlign: TextAlign.center,
                        showCursor: false,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: greyColor),
                          ),
                          hintText: 'Deine E-mail-Adresse',
                          hintStyle: TextStyle(
                            fontSize: 22,
                            color: lightGreyColor,
                          ),
                          alignLabelWithHint: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 7),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: isValid ? Colors.blue : lightGreyColor,
                          ),
                          color: isValid ? Colors.blue : lightGreyColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Consumer<ApiRegistrationProvider>(
                          builder: (context, value, child) {
                        return TextButton(
                            onPressed: () async {
                              if (isValid) {
                                int response =
                                    await userRegisterProvider.reactivateUser(
                                        myController.text.trim(),
                                        value.anonAuthToken);
                                if (response != 200) {
                                  ToastContext().init(context);
                                  Toast.show("Some Error occured",
                                      duration: Toast.lengthShort,
                                      gravity: Toast.bottom);
                                } else {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              OTPValidationScreen(
                                                email: myController.text.trim(),
                                              )));
                                }
                              }
                            },
                            child: const Text(
                              'Los geht\'s!',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ));
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            child: Text(
                          'Noch nicht registriert?',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: lightGreyColor),
                        )),
                        SizedBox(
                            child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const SignUpScreen()));
                          },
                          child: Text(
                            'Zur Registrierung!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: greyColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: WaveWidget(
                    config: CustomConfig(
                      colors: [Colors.blue],
                      durations: [35000],
                      heightPercentages: [0.002],
                    ),
                    size: const Size(
                      double.infinity,
                      double.infinity,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
