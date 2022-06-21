import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hearooz/home/widgets/profile_icon.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class AuthVerification extends StatelessWidget {
  const AuthVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color greyColor = const Color(0xff4c504f);
    Color greenishBlueColor = const Color(0xff44d3b6);
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
                      'Login erfolgreich!',
                      style: TextStyle(
                        color: greenishBlueColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      height: 80,
                      width: 200,
                      child: Image.network(
                          'https://i.postimg.cc/GtwtLt35/tick-mark.png'),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: lightGreyColor,
                          ),
                          color: Colors.blue,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Weiter',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          )),
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
