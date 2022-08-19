import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hearooz/home/widgets/home/home_screen_podcast_channel.dart';
import 'package:hearooz/providers/profile_screen_provider.dart';
import 'package:provider/provider.dart';

class MainPageListView extends StatefulWidget {
  final List<dynamic> list;
  final List<dynamic> list1;
  final List<dynamic> list2;
  final List<dynamic> list3;
  const MainPageListView({
    Key? key,
    required this.list,
    required this.list1,
    required this.list2,
    required this.list3,
  }) : super(key: key);

  @override
  State<MainPageListView> createState() => _MainPageListViewState();
}

class _MainPageListViewState extends State<MainPageListView> {
  Future<String?> getImgUrl(String? imgUrl) async {
    if (imgUrl != null) {
      try {
        Uint8List bytes =
            (await NetworkAssetBundle(Uri.parse(imgUrl)).load(imgUrl))
                .buffer
                .asUint8List();
        print("The image exists!");
        return imgUrl;
      } catch (e) {
        print("Error: $e");
        return null;
      }
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context1, index) {
          List<dynamic> data = index == 0
              ? widget.list
              : index == 1
                  ? widget.list1
                  : index == 2
                      ? widget.list2
                      : widget.list3;
          return Consumer<ProfileScreenProvider>(
              builder: (context2, value, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: GestureDetector(
                  onTap: () {
                    value.isCatalogueClicked(true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePagePodcastAlbum(
                          list: data,
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FutureBuilder(
                          future: getImgUrl(data[0]['data']['cover_image']),
                          builder: (context, AsyncSnapshot snapshot) {
                            bool error = snapshot.data == null;
                            return SizedBox(
                                child: !error
                                    ? Image.network(
                                        snapshot.data,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.asset(
                                        'assets/app_icon.png',
                                        fit: BoxFit.fill,
                                      ));
                          }),
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
