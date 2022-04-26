import 'package:flutter/material.dart';
import 'package:hearooz/home/header_sub/circular_main_page_list_view.dart';
import 'package:hearooz/home/header_sub/main_page_list_view.dart';
import 'package:hearooz/home/header_sub/title_row.dart';
import 'package:hearooz/home/main_header.dart';
import 'package:hearooz/utils/colors.dart';

class MainHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      SizedBox(height: 10),
                      TitleRow(
                        title: 'Neue Folgen',
                        imageUrl:
                            'https://img.icons8.com/fluency/344/new--v2.png',
                      ),
                      SizedBox(height: 10),
                      MainPageListView(),
                      SizedBox(height: 10),
                      TitleRow(
                        title: 'Neue Sendungen',
                        imageUrl:
                            'https://img.icons8.com/fluency/344/new--v2.png',
                      ),
                      SizedBox(height: 10),
                      CircularMainPageListView(),
                      SizedBox(height: 10),
                      TitleRow(
                        title: 'Charts',
                        imageUrl:
                            'https://img.icons8.com/fluency/344/new--v2.png',
                      ),
                      SizedBox(height: 10),
                      CircularMainPageListView(),
                      SizedBox(height: 10),
                      TitleRow(
                        title: 'Aktuelles',
                        imageUrl:
                            'https://img.icons8.com/fluency/344/new--v2.png',
                      ),
                      SizedBox(height: 10),
                      MainPageListView(),
                      SizedBox(height: 10),
                      TitleRow(
                        title: 'Sendugen',
                        imageUrl:
                            'https://img.icons8.com/fluency/344/new--v2.png',
                      ),
                      SizedBox(height: 10),
                      CircularMainPageListView(),
                      SizedBox(height: 10),
                      TitleRow(
                        title: 'kakadu',
                        imageUrl:
                            'https://img.icons8.com/fluency/344/new--v2.png',
                      ),
                      SizedBox(height: 10),
                      CircularMainPageListView(),
                      SizedBox(height: 10),
                      TitleRow(
                        title: 'kakadu update',
                        imageUrl:
                            'https://img.icons8.com/fluency/344/new--v2.png',
                      ),
                      SizedBox(height: 10),
                      MainPageListView(),
                      SizedBox(height: 10),
                      TitleRow(
                        title: 'Mikadu: Radio fur kinder',
                        imageUrl:
                            'https://img.icons8.com/fluency/344/new--v2.png',
                      ),
                      SizedBox(height: 10),
                      CircularMainPageListView(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
