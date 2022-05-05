import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hearooz/home/header_sub/media_buttons.dart';
import 'package:hearooz/home/screens/search_button_tap.dart';
import 'package:hearooz/utils/colors.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 200,
      color: Colors.blue[700],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    'https://cdn.dribbble.com/users/3956332/screenshots/15409382/media/0ab132c5df684ea869c3b1c4fca01bf2.jpg',
                    height: 100,
                    width: 100,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const MediaButton(
                icon: CupertinoIcons.heart_fill,
                height: 40,
                width: 40,
              ),
              const MediaButton(
                icon: CupertinoIcons.refresh_bold,
                height: 40,
                width: 40,
              ),
              const MediaButton(
                icon: CupertinoIcons.play_arrow_solid,
                height: 50,
                width: 50,
              ),
              const MediaButton(
                icon: CupertinoIcons.refresh_thin,
                height: 40,
                width: 40,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 15),
                child: const LinearProgressIndicator(
                  minHeight: 8,
                  value: 0.3,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(MyColor.yellowSplashColor),
                  backgroundColor: Colors.blue,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  '00:00',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  CupertinoIcons.line_horizontal_3,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.home,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        CupertinoIcons.heart_fill,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchButtonTap()),
                        );
                      },
                      child: const Icon(
                        CupertinoIcons.search,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  CupertinoIcons.profile_circled,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
