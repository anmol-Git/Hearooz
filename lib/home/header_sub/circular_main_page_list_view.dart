import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/profile_screen_provider.dart';
import '../widgets/home/home_screen_podcast_channel.dart';

class CircularMainPageListView extends StatefulWidget {
  final List<dynamic> list;
  final List<dynamic> list1;
  final List<dynamic> list2;
  final List<dynamic> list3;
  const CircularMainPageListView({
    Key? key,
    required this.list,
    required this.list1,
    required this.list2,
    required this.list3,
  }) : super(key: key);

  @override
  State<CircularMainPageListView> createState() =>
      _CircularMainPageListViewState();
}

class _CircularMainPageListViewState extends State<CircularMainPageListView> {
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 150,
                width: 150,
                child: GestureDetector(
                  onTap: () {
                    value.isCatalogueClicked(true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePagePodcastAlbum(list: data)),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child: FadeInImage(
                      image: data[0]['data']['cover_image'] != null
                          ? NetworkImage(data[0]['data']['cover_image'])
                          : const NetworkImage(
                              'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png'),
                      placeholder: const AssetImage("assets/app_icon.png"),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset('assets/app_icon.png',
                              fit: BoxFit.contain),
                        );
                      },
                      fit: BoxFit.fill,
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
