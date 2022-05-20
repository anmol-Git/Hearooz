import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hearooz/home/header_sub/circular_main_page_list_view.dart';
import 'package:hearooz/home/header_sub/main_page_list_view.dart';
import 'package:hearooz/home/header_sub/title_row.dart';
import 'package:hearooz/home/main_header.dart';
import 'package:hearooz/home/widgets/heart_icon_screen.dart';
import 'package:hearooz/home/widgets/home_icon_screen.dart';
import 'package:hearooz/home/widgets/profile_icon.dart';
import 'package:hearooz/home/widgets/search_icon_screen.dart';
import 'package:hearooz/home/widgets/side_container.dart';
import 'package:hearooz/utils/colors.dart';

class MainHomePage extends StatefulWidget {
  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  bool selected = false;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          toolbarHeight: 200,
          elevation: 0,
          titleSpacing: 0,
          title: const Header(),
          bottom: PreferredSize(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.line_horizontal_3,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print('tapped');
                        setState(() {
                          selected = !selected;
                        });
                      },
                    ),
                  ),
                ),
                const Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: 50,
                    child: TabBar(
                      indicatorColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      indicatorPadding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.zero,
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.home,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            CupertinoIcons.heart_fill,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            CupertinoIcons.search,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Icon(
                              CupertinoIcons.profile_circled,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            preferredSize: const Size.fromHeight(40),
          ),
        ),
        backgroundColor: Colors.blue[700],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: selected ? 150 : 0,
                child: AnimatedContainer(
                  alignment: Alignment.centerLeft,
                  width: selected ? 200.0 : 0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = !selected;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.blue[700],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 25,
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 25,
                              child: const Text(
                                'HEAROOZ.de',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 25,
                              child: const Text(
                                'Hilfe',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 25,
                              child: const Text(
                                'Datenschutz',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 700,
                child: const TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      HomeIconScreen(),
                      HeartIconScreen(),
                      SearchIconScreen(),
                      ProfileScreen()
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
