import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hearooz/auth/auth_verification.dart';
import 'package:hearooz/providers/api_registration_provider.dart';
import 'package:hearooz/providers/profile_screen_provider.dart';
import 'package:hearooz/providers/user_registration.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class OTPValidationScreen extends StatefulWidget {
  final String? email;
  const OTPValidationScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<OTPValidationScreen> createState() => _OTPValidationScreenState();
}

class _OTPValidationScreenState extends State<OTPValidationScreen> {
  late UserRegistrationProvider provider;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      provider = Provider.of<UserRegistrationProvider>(context, listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color greyColor = const Color(0xff4c504f);
    Color lightGreyColor = const Color(0xff8b8c90);
    String a = '';
    String b = '';
    String c = '';
    String d = '';
    String e = '';
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
                      'Fast geschafft',
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Wir haben einen Code geschichkt an',
                      style: TextStyle(
                        color: lightGreyColor,
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.email.toString(),
                      style: TextStyle(
                        color: greyColor,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Gib ihn heir ein:',
                      style: TextStyle(
                        color: lightGreyColor,
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              onChanged: (val) {
                                if (val.length == 1) {
                                  a = val.toString();
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              onChanged: (val) {
                                if (val.length == 1) {
                                  b = val.toString();
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              onChanged: (val) {
                                if (val.length == 1) {
                                  c = val.toString();
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              onChanged: (val) {
                                if (val.length == 1) {
                                  d = val.toString();
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: Consumer<ProfileScreenProvider>(
                                builder: (context2, provider2, child2) {
                              return Consumer<ApiRegistrationProvider>(
                                  builder: (context, value, child) {
                                return TextFormField(
                                  style: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  onChanged: (val) async {
                                    if (val.length == 1) {
                                      e = val.toString();
                                      String input = a + b + c + d + e;
                                      print(input);

                                      int response = await provider.verifyUser(
                                          widget.email ?? '',
                                          input,
                                          value.anonAuthToken);

                                      if (response == 200) {
                                        provider2.isVerfied = true;
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    const AuthVerification()));
                                      } else {
                                        ToastContext().init(context);
                                        Toast.show("Some Error occured",
                                            duration: Toast.lengthShort,
                                            gravity: Toast.bottom);
                                      }
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                );
                              });
                            }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            child: Text(
                          'keine Mail erhalten?',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: lightGreyColor),
                        )),
                        Consumer<ApiRegistrationProvider>(
                            builder: (context, value, child) {
                          return TextButton(
                            onPressed: () async {
                              int response = await provider.reactivateUser(
                                  widget.email ?? '', value.anonAuthToken);
                              if (response == 200) {
                                ToastContext().init(context);
                                Toast.show("OTP send to your email address",
                                    duration: Toast.lengthShort,
                                    gravity: Toast.bottom);
                              } else {
                                ToastContext().init(context);
                                Toast.show("Some Error occured",
                                    duration: Toast.lengthShort,
                                    gravity: Toast.bottom);
                              }
                            },
                            child: Text(
                              'Neuen Code senden!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: greyColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Abbrechen',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          color: greyColor,
                          fontWeight: FontWeight.w400),
                    ),
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
