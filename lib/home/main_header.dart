import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hearooz/home/header_sub/media_buttons.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

  @override
  void initState() {
    super.initState();

    setAudio();
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
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
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    audioPlayer.setUrl(url);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
                child: IconButton(
                  icon: const Icon(
                    CupertinoIcons.refresh_bold,
                  ),
                  iconSize: 30,
                  onPressed: () async {
                    if (position.inSeconds - 15 > 0) {
                      await audioPlayer
                          .seek(Duration(seconds: position.inSeconds - 15));
                    }
                  },
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  iconSize: 40,
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.resume();
                    }
                  },
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: IconButton(
                  icon: const Icon(
                    CupertinoIcons.refresh_thin,
                  ),
                  iconSize: 30,
                  onPressed: () async {
                    if (position.inSeconds + 15 < duration.inSeconds) {
                      await audioPlayer
                          .seek(Duration(seconds: position.inSeconds + 15));
                    }
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 0.0)),
                  child: Slider(
                    thumbColor: Colors.white,
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (val) async {
                      final position = Duration(seconds: val.toInt());
                      await audioPlayer.seek(position);

                      await audioPlayer.resume();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(duration - position)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
