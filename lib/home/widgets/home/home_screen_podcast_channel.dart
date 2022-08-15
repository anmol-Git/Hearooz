import 'package:flutter/material.dart';

class HomePagePodcastAlbum extends StatelessWidget {
  const HomePagePodcastAlbum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Text('We are inside the text')],
      ),
    );
  }
}
