import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hearooz/providers/api_registration_provider.dart';
import 'package:hearooz/providers/audio_manager_provider.dart';
import 'package:hearooz/providers/favorite_item_provider.dart';
import 'package:hearooz/providers/user_registration.dart';
import 'package:provider/provider.dart';

import '../../../audio/page_manager.dart';
import '../../../audio/services/service_locator.dart';

class HomePagePodcastAlbum extends StatefulWidget {
  final List<dynamic> list;
  const HomePagePodcastAlbum({Key? key, required this.list}) : super(key: key);

  @override
  State<HomePagePodcastAlbum> createState() => _HomePagePodcastAlbumState();
}

class _HomePagePodcastAlbumState extends State<HomePagePodcastAlbum> {
  var tappedIndex = -1;

  @override
  void initState() {
    super.initState();
    // getIt<PageManager>().init();
  }

  @override
  void dispose() {
    // getIt<PageManager>().dispose();
    super.dispose();
  }

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
    final pageManager = getIt<PageManager>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: widget.list.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 5.0),
                    child: Consumer(builder: (context, authprovider, child) {
                      return Consumer<AudioManagerProvider>(
                          builder: (context, value, child) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GestureDetector(
                            onTap: (() async {
                              setState(() {
                                tappedIndex = index;
                              });
                              await value.setUpAudio(
                                  widget.list[index]['id'],
                                  widget.list[index]['data']['title'],
                                  widget.list[0]['data']['cover_image'] ??
                                      'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
                                  context);

                              pageManager.stop();
                              pageManager.seek(const Duration(seconds: 0));
                              pageManager.remove();
                              pageManager.add(
                                  value.audioFile, value.title, 'Hearooz');
                              pageManager.play();
                            }),
                            child: Container(
                              color: tappedIndex == index
                                  ? Colors.blue[300]
                                  : Colors.transparent,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width:
                                        MediaQuery.of(context).size.width * .25,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: FutureBuilder(
                                              future: getImgUrl(widget.list[0]
                                                  ['data']['cover_image']),
                                              builder: (context,
                                                  AsyncSnapshot snapshot) {
                                                bool error =
                                                    snapshot.data == null;
                                                return SizedBox(
                                                    child: !error
                                                        ? Image.network(
                                                            snapshot.data)
                                                        : Image.asset(
                                                            'assets/app_icon.png'));
                                              }),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .7,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.list[index]['data']['title'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color:
                                                Color.fromARGB(255, 35, 35, 35),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Consumer<UserRegistrationProvider>(
                                            builder: (context, auth, child) {
                                          return Consumer<FavoriteItemProvider>(
                                              builder: (context, value, child) {
                                            return auth.refreshToken != ''
                                                ? IconButton(
                                                    icon: Icon(value.list
                                                            .where((element) =>
                                                                element['id'] ==
                                                                widget.list[
                                                                        index]
                                                                    ['id'])
                                                            .isNotEmpty
                                                        ? CupertinoIcons
                                                            .heart_fill
                                                        : CupertinoIcons.heart),
                                                    onPressed: () {
                                                      print(
                                                          'the user auth token is ${auth.refreshToken}');
                                                      value.addToFavorite(
                                                          auth.refreshToken,
                                                          widget.list[index],
                                                          widget.list[index]
                                                              ['id']);
                                                    },
                                                    iconSize: 36,
                                                    color: Colors.red,
                                                  )
                                                : const SizedBox.shrink();
                                          });
                                        })
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    }),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
