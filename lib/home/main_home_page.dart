import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hearooz/auth/login_screen.dart';
import 'package:hearooz/home/main_header.dart';
import 'package:hearooz/home/widgets/heart_icon_screen.dart';
import 'package:hearooz/home/widgets/home/home_icon_screen.dart';
import 'package:hearooz/home/widgets/profile/profile_icon.dart';
import 'package:hearooz/home/widgets/profile/profile_icon_user.dart';
import 'package:hearooz/home/widgets/search_icon_screen.dart';
import 'package:hearooz/models/device%20registration/api_registration.dart';
import 'package:hearooz/providers/api_registration_provider.dart';
import 'package:hearooz/providers/profile_screen_provider.dart';
import 'package:hearooz/providers/user_registration.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/link.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

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

  late ApiRegisteration response;

  String anonAuthToken = '';
  String refreshToken = '';
  late ProfileScreenProvider stateProvider;
  @override
  void initState() {
    super.initState();
    readData();
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

        var provider =
            Provider.of<ProfileScreenProvider>(context, listen: false);
        provider.isCatalogueClicked(false);
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
  }

  // void myListener() {
  //   var provider = Provider.of(context, listen: false)<ProfileScreenProvider>();
  //   print('object');
  //   if (provider.isTapped == true) {
  //     Navigator.pop(context);
  //   }

  //   provider.isCatalogueClicked(false);
  // }

  void readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? str = prefs.getString('token');
    if (str != null) {
      if (str.length > 10) {
        refreshToken = str;
        print('The shared prefrence value is : ' + refreshToken);
      }
    }
    if (refreshToken == '') {
      //? for anonomous user
      Future.delayed(const Duration(milliseconds: 100), () {
        Provider.of<ApiRegistrationProvider>(context, listen: false)
            .anonomousUserRegistration();
      });
    } else {
      //? for signed up user
      Future.delayed(const Duration(milliseconds: 100), () async {
        String token =
            await Provider.of<ApiRegistrationProvider>(context, listen: false)
                .signedUpUserRegisteration(refreshToken);
        setState(() {
          Provider.of<UserRegistrationProvider>(context, listen: false)
              .refreshToken = token.substring(7);
          Provider.of<ProfileScreenProvider>(context, listen: false).isVerfied =
              true;
          print('refresh token when user ' + token);
        });
      });
    }
  }

  void storeData(String text) async {
    String finalText = "Bearer " + text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', finalText);
  }

  @override
  void dispose() {
    _heartAnimationController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 4,
      child: MiniplayerWillPopScope(
        onWillPop: () async {
          final NavigatorState? navigator = _navigatorKey.currentState;

          if (navigator != null) {
            if (!navigator.canPop()) return true;
            navigator.pop();
          }

          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.blue[700],
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 210,
                  child: Miniplayer(
                    minHeight: 210,
                    maxHeight: 210,
                    builder: (height, percentage) => SizedBox(
                      height: 210,
                      child: AppBar(
                        backgroundColor: Colors.blue[700],
                        toolbarHeight: 210,
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
                                      setState(() {
                                        selected = !selected;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Consumer<ProfileScreenProvider>(
                                    builder: (context1, value, child) {
                                  return SizedBox(
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
                                            size: _selectedIndex == 0
                                                ? _homeAnimation.value
                                                : 30,
                                            color: _selectedIndex == 0
                                                ? Colors.yellow
                                                : Colors.white,
                                          ),
                                        ),
                                        Tab(
                                          icon: Icon(
                                            CupertinoIcons.heart_fill,
                                            size: _selectedIndex == 1
                                                ? _heartAnimation.value
                                                : 30,
                                            color: _selectedIndex == 1
                                                ? Colors.red
                                                : Colors.white,
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
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
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
                                  );
                                }),
                              ),
                            ],
                          ),
                          preferredSize: const Size.fromHeight(40),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 210,
                  height: MediaQuery.of(context).size.height - 200,
                  width: MediaQuery.of(context).size.width,
                  child: Navigator(
                    key: _navigatorKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      settings: settings,
                      builder: (context) => SingleChildScrollView(
                        child: Column(
                          children: [
                            Consumer<ProfileScreenProvider>(
                                builder: (context, value, child) {
                              return Container(
                                color: Colors.blue[700],
                                alignment: Alignment.centerLeft,
                                height: selected
                                    ? value.isVerfied == true
                                        ? 180
                                        : 150
                                    : 0,
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
                                      child: Consumer<UserRegistrationProvider>(
                                          builder: (context2, value2, child2) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            value.isVerfied == true
                                                ? Link(
                                                    uri: Uri.parse(
                                                        'https://www.hearooz.de/app/login?handover=${value2.refreshToken}&target=user'),
                                                    builder:
                                                        (BuildContext context,
                                                            Future<void>
                                                                    Function()?
                                                                followLink) {
                                                      return GestureDetector(
                                                        onTap: followLink,
                                                        child: Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          height: 25,
                                                          child: const Text(
                                                            'Mein Account',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 24),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  )
                                                : GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .push(MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  const LoginScreen()));
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      height: 25,
                                                      child: const Text(
                                                        'Login',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 24),
                                                      ),
                                                    ),
                                                  ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Link(
                                              uri: Uri.parse(
                                                  'https://www.hearooz.de/'),
                                              builder: (BuildContext context,
                                                  Future<void> Function()?
                                                      followLink) {
                                                return GestureDetector(
                                                  onTap: followLink,
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    height: 25,
                                                    child: const Text(
                                                      'HEAROOZ.de',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                              uri: Uri.parse(
                                                  'https://www.hearooz.de/support'),
                                              builder: (BuildContext context,
                                                      Future<void> Function()?
                                                          followLink) =>
                                                  GestureDetector(
                                                onTap: followLink,
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 25,
                                                  child: const Text(
                                                    'Hilfe',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                                      Future<void> Function()?
                                                          followLink) =>
                                                  GestureDetector(
                                                onTap: followLink,
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 25,
                                                  child: const Text(
                                                    'Datenschutz',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 24),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            value.isVerfied == true
                                                ? GestureDetector(
                                                    onTap: () {
                                                      value.isVerfied = false;
                                                      storeData('');
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      height: 25,
                                                      child: const Text(
                                                        'Logout',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 24),
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox(
                                                    height: 0,
                                                  ),
                                          ],
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              );
                            }),
                            Consumer<ProfileScreenProvider>(
                              builder: ((context, value, child) {
                                return SizedBox(
                                  height: selected && value.isVerfied == true
                                      ? height - 380
                                      : selected
                                          ? height - 350
                                          : height - 200,
                                  child: TabBarView(
                                      controller: _tabController,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                        const HomeIconScreen(),
                                        const HeartIconScreen(),
                                        const SearchIconScreen(),
                                        value.isVerfied == true
                                            ? const ProfileScreenUser()
                                            : const ProfileScreen()
                                      ]),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
