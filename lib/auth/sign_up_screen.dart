import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hearooz/auth/login_screen.dart';
import 'package:hearooz/auth/otp_validation_screen.dart';
import 'package:hearooz/providers/api_registration_provider.dart';
import 'package:hearooz/providers/user_registration.dart';
import 'package:provider/provider.dart';
import 'package:wave/config.dart';
import 'package:toast/toast.dart';
import 'package:wave/wave.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;

  final myController = TextEditingController();
  late final UserRegistrationProvider userRegisterProvider;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      userRegisterProvider =
          Provider.of<UserRegistrationProvider>(context, listen: false);
    });
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _onChange(bool? newValue) => setState(() {
        isChecked = !isChecked;
      });
  bool isChecked2 = false;

  void _onChange2(bool? newValue) => setState(() {
        isChecked2 = !isChecked2;
      });
  bool isChecked3 = false;

  void _onChange3(bool? newValue) => setState(() {
        isChecked3 = !isChecked3;
      });
  @override
  Widget build(BuildContext context) {
    Color greyColor = const Color(0xff4c504f);
    Color lightGreyColor = const Color(0xff8b8c90);
    return Scaffold(
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
                    'Analog anlegen',
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
                    child: TextField(
                      controller: myController,
                      textAlign: TextAlign.center,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Checkbox(value: isChecked, onChanged: _onChange),
                      Row(
                        children: [
                          Text(
                            'Ich akzeptiere die',
                            style: TextStyle(
                              fontSize: 16,
                              color: lightGreyColor,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Datenschutzbestimmungen',
                            style: TextStyle(
                                fontSize: 16,
                                color: greyColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Checkbox(value: isChecked2, onChanged: _onChange2),
                      Row(
                        children: [
                          Text(
                            'Ich akzeptiere die',
                            style: TextStyle(
                              fontSize: 16,
                              color: lightGreyColor,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            'AGBs',
                            style: TextStyle(
                                fontSize: 16,
                                color: greyColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Checkbox(value: isChecked3, onChanged: _onChange3),
                      Row(
                        children: [
                          Text(
                            'Ich moche uber  Neuigkeiten von HEAROOZ per \nE-mail informiert werden',
                            style: TextStyle(
                              fontSize: 16,
                              color: lightGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: isChecked && isChecked2
                              ? Colors.blue
                              : lightGreyColor,
                        ),
                        color: isChecked && isChecked2
                            ? Colors.blue
                            : lightGreyColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Consumer<ApiRegistrationProvider>(
                        builder: (context, value, child) {
                      return TextButton(
                          onPressed: () async {
                            if (isChecked && isChecked2) {
                              var response =
                                  await userRegisterProvider.registerUser(
                                      myController.text, value.anonAuthToken);
                              print('The response is ' + response.toString());
                              if (response == 201) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            OTPValidationScreen(
                                              email: myController.text,
                                            )));
                              } else {
                                ToastContext().init(context);
                                Toast.show("Some Error occured",
                                    duration: Toast.lengthShort,
                                    gravity: Toast.bottom);
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
                        'Bereits registriert?',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: lightGreyColor),
                      )),
                      SizedBox(
                          child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const LoginScreen()));
                        },
                        child: Text(
                          'Zur login!',
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
      ),
    );
  }
}
