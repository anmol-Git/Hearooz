import 'package:flutter/material.dart';
import 'package:hearooz/home/widgets/home/home_screen_podcast_channel.dart';
import 'package:hearooz/providers/profile_screen_provider.dart';
import 'package:provider/provider.dart';

class MainPageListView extends StatelessWidget {
  const MainPageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context1, index) {
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
                          builder: (context) => const HomePagePodcastAlbum()),
                    );
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.pink,
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
