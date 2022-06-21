import 'package:flutter/material.dart';

class ProfileScreenUser extends StatelessWidget {
  const ProfileScreenUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://www.clipartmax.com/png/full/185-1851810_urban-monkey-urban-monkey-india-logo.png',
                height: 120,
                width: 100,
              ),
              const Text(
                'Hearoo 1',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF4a95fa))),
                  onPressed: () {
                    //TODO
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
        ],
      ),
    );
  }
}
