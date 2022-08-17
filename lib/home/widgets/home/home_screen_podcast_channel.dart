import 'package:flutter/material.dart';

class HomePagePodcastAlbum extends StatelessWidget {
  final List<dynamic> list;
  const HomePagePodcastAlbum({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 5.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width * .25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            image: list[0]['data']['cover_image'] != null
                                ? NetworkImage(list[0]['data']['cover_image'])
                                : const NetworkImage(
                                    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png'),
                            placeholder:
                                const AssetImage("assets/app_icon.png"),
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
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .7,
                        child: Text(
                          list[index]['data']['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 35, 35, 35),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                );
              })),
        ),
      ],
    );
  }
}
