import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hearooz/auth/login_screen.dart';
import 'package:hearooz/home/main_header.dart';
import 'package:hearooz/home/widgets/heart_icon_screen.dart';
import 'package:hearooz/home/widgets/home_icon_screen.dart';
import 'package:hearooz/home/widgets/profile_icon.dart';
import 'package:hearooz/home/widgets/search_icon_screen.dart';
import 'package:url_launcher/link.dart';

class MainHomePage extends StatefulWidget {
  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>
    with TickerProviderStateMixin {
  bool selected = false;
  bool isheartSet = false;
  int _selectedIndex = 0;
  late TabController _tabController;

  late AnimationController _homeAnimationController;
  late Animation _homeAnimation;

  late AnimationController _heartAnimationController;
  late Animation _heartAnimation;

  late AnimationController _searchAnimationController;
  late Animation _searchAnimation;

  late AnimationController _profileAnimationController;
  late Animation _profileAnimation;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);

    _homeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 80));
    _homeAnimation = Tween(begin: 30.0, end: 40.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _homeAnimationController));

    _heartAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 80));
    _heartAnimation = Tween(begin: 30.0, end: 40.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _heartAnimationController));

    _searchAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 80));
    _searchAnimation = Tween(begin: 30.0, end: 40.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _searchAnimationController));

    _profileAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 80));
    _profileAnimation = Tween(begin: 30.0, end: 40.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _profileAnimationController));

    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;

        if (_selectedIndex == 0) {
          _homeAnimationController.forward();
        }

        if (_selectedIndex == 1) {
          _heartAnimationController.forward();
        }

        if (_selectedIndex == 2) {
          _searchAnimationController.forward();
        }

        if (_selectedIndex == 3) {
          _profileAnimationController.forward();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _heartAnimationController.dispose();
    _tabController.dispose();
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
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: 50,
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      indicatorPadding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.zero,
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.home,
                            size:
                                _selectedIndex == 0 ? _homeAnimation.value : 30,
                            color: _selectedIndex == 0
                                ? Colors.yellow
                                : Colors.white,
                          ),
                        ),
                        Tab(
                          child: Icon(
                            CupertinoIcons.heart_fill,
                            size: _selectedIndex == 1
                                ? _heartAnimation.value
                                : 30,
                            color:
                                _selectedIndex == 1 ? Colors.red : Colors.white,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            CupertinoIcons.search,
                            size: _selectedIndex == 2
                                ? _searchAnimation.value
                                : 30,
                            color: _selectedIndex == 2
                                ? Colors.yellow
                                : Colors.white,
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Icon(
                              CupertinoIcons.profile_circled,
                              size: _selectedIndex == 3
                                  ? _profileAnimation.value
                                  : 30,
                              color: _selectedIndex == 3
                                  ? Colors.yellow
                                  : Colors.white,
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.blue[700],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const LoginScreen()));
                            },
                            child: Container(
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
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Link(
                            uri: Uri.parse('https://www.hearooz.de/'),
                            builder: (BuildContext context,
                                Future<void> Function()? followLink) {
                              return GestureDetector(
                                onTap: followLink,
                                child: Container(
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
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Link(
                            uri: Uri.parse('https://www.hearooz.de/support'),
                            builder: (BuildContext context,
                                    Future<void> Function()? followLink) =>
                                GestureDetector(
                              onTap: followLink,
                              child: Container(
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
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Link(
                            uri: Uri.parse(
                                'https://www.hearooz.de/datenschutzerklarung-app'),
                            builder: (BuildContext context,
                                    Future<void> Function()? followLink) =>
                                GestureDetector(
                              onTap: followLink,
                              child: Container(
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
              Container(
                height: 700,
                child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
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
