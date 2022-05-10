import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hearooz/home/header_sub/circular_main_page_list_view.dart';
import 'package:hearooz/home/header_sub/main_page_list_view.dart';
import 'package:hearooz/home/header_sub/title_row.dart';
import 'package:hearooz/home/main_header.dart';
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
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          toolbarHeight: 200,
          elevation: 0,
          titleSpacing: 0,
          title: const Header(),
          bottom: PreferredSize(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
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
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 3,
                  child: const TabBar(
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.profile_circled,
                      size: 30,
                      color: Colors.white,
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
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Neue Folgen',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const MainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Neue Sendungen',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Charts',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Aktuelles',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const MainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Sendugen',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'kakadu',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'kakadu update',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const MainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Mikadu: Radio fur kinder',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Spannung',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        SizedBox(
                            height: 150,
                            child: Image.network(
                              'https://static.ahrefs.com/static/assets/static/ahrefs-logo-8b1ac30fdccbb84b3da69d159b5914ca.jpg',
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fitWidth,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            height: 150,
                            child: Image.network(
                              'https://animals.sandiegozoo.org/sites/default/files/2016-08/animals_hero_bald_eagle.jpg',
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                            )),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Horpiele PREMIUM',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Horbucher PREMIUM',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Ostern',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const MainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Wissen',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const MainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Leseecke',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const MainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Familie & Co',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const MainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Marchen',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Dinosaurier',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const MainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Tierisches Wissen',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const MainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Interviews',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const MainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Tiere',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Schule & Lerner',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Einschlafen',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const MainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Ab 3 jahre',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Ab 6 jahre',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Ab 9 jahre',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Plauderei',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Geschichten',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Horspab auf Englisch',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Horspab auf franzosisch',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Entspannung',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Bewengung',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Unsere Empfehlungeg',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const MainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Buchtipps',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Sport',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const MainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'Gott und die welt',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const CircularMainPageListView(),
                        const SizedBox(height: 10),
                        const TitleRow(
                          title: 'reportagen',
                          imageUrl:
                              'https://img.icons8.com/fluency/344/new--v2.png',
                        ),
                        const SizedBox(height: 10),
                        const MainPageListView(),
                        const SizedBox(height: 10)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
