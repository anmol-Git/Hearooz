import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hearooz/audio/notifiers/play_button_notifier.dart';
import 'package:hearooz/audio/notifiers/progress_notifier.dart';
import 'package:hearooz/audio/page_manager.dart';
import 'package:hearooz/audio/services/service_locator.dart';
import 'package:hearooz/home/header_sub/media_buttons.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

  @override
  void initState() {
    super.initState();
    getIt<PageManager>().init();
  }

  String formatTime(Duration duration) {
    String twoDigit(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigit(duration.inHours);
    final minutes = twoDigit(duration.inMinutes.remainder(60));
    final seconds = twoDigit(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  Future setAudio() async {
    //  audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    //audioPlayer.setUrl(url);
  }

  @override
  void dispose() {
    getIt<PageManager>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return Container(
      height: 160,
      color: Colors.blue[700],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    'https://cdn.dribbble.com/users/3956332/screenshots/15409382/media/0ab132c5df684ea869c3b1c4fca01bf2.jpg',
                    height: 100,
                    width: 100,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const MediaButton(
                icon: CupertinoIcons.heart_fill,
                height: 40,
                width: 40,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: ValueListenableBuilder<ProgressBarState>(
                    valueListenable: pageManager.progressNotifier,
                    builder: (_, value, __) {
                      return IconButton(
                        icon: const Icon(
                          CupertinoIcons.refresh_bold,
                        ),
                        iconSize: 30,
                        onPressed: () async {
                          if (value.current.inSeconds - 15 > 0) {
                            pageManager.seek(Duration(
                                seconds: value.current.inSeconds - 15));
                          }
                        },
                      );
                    }),
              ),
              ValueListenableBuilder<ButtonState>(
                  valueListenable: pageManager.playButtonNotifier,
                  builder: (_, value, __) {
                    switch (value) {
                      case ButtonState.loading:
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          width: 32.0,
                          height: 32.0,
                          child: const CircularProgressIndicator(),
                        );
                      case ButtonState.paused:
                        return CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: IconButton(
                            icon: const Icon(
                              Icons.play_arrow,
                            ),
                            iconSize: 40,
                            onPressed: () async {
                              pageManager.stop();
                              pageManager.remove();
                              pageManager.add(url, 'Shinzou Wo Sasageyo',
                                  'Attack on titan');
                              print('in here!');
                              pageManager.play();
                            },
                          ),
                        );
                      case ButtonState.playing:
                        return CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: IconButton(
                            icon: const Icon(
                              Icons.pause,
                            ),
                            iconSize: 40,
                            onPressed: () async {
                              pageManager.pause();
                            },
                          ),
                        );
                    }
                  }),
              ValueListenableBuilder<ProgressBarState>(
                  valueListenable: pageManager.progressNotifier,
                  builder: (_, value, __) {
                    return CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: IconButton(
                        icon: const Icon(
                          CupertinoIcons.refresh_thin,
                        ),
                        iconSize: 30,
                        onPressed: () async {
                          if (value.current.inSeconds + 15 <
                              value.total.inSeconds) {
                            pageManager.seek(Duration(
                                seconds: value.current.inSeconds + 15));
                          }
                        },
                      ),
                    );
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder<ProgressBarState>(
                valueListenable: pageManager.progressNotifier,
                builder: (_, value, __) {
                  return Container(
                    height: 14,
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width * 0.7,
                    alignment: Alignment.topCenter,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          trackHeight: 10,
                          overlayColor: Colors.transparent,
                          thumbColor: Colors.transparent,
                          activeTrackColor: Colors.yellow,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 0.0)),
                      child: Slider(
                        thumbColor: Colors.white,
                        min: 0,
                        max: value.total.inSeconds.toDouble(),
                        value: value.current.inSeconds.toDouble(),
                        onChanged: (val) async {
                          final position = Duration(seconds: val.toInt());
                          if (position < value.total &&
                              position > Duration.zero) {
                            pageManager.seek(position);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
              ValueListenableBuilder<ProgressBarState>(
                  valueListenable: pageManager.progressNotifier,
                  builder: (_, value, __) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formatTime(value.total - value.current)),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
