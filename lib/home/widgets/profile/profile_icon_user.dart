import 'package:flutter/material.dart';

class ProfileScreenUser extends StatelessWidget {
  const ProfileScreenUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Image.network(
                  'https://www.clipartmax.com/png/full/185-1851810_urban-monkey-urban-monkey-india-logo.png',
                  height: 120,
                  width: 100,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Text(
                  'Hearoo 1',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ClipRRect(
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
                      'Profile bearbeiten',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
