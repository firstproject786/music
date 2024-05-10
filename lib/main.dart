import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music/habit.dart';

import 'journey.dart';
import 'musicc.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Journy(),
  ));
}

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String curentime = '';
  String endtime = '';
  double mindurration = 0, maxduration = 0, curduration = 0;
  AudioPlayer player = AudioPlayer();
  double currentDuration = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('music example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.red,
              height: 300,
              width: 300,
            ),
          ),
          Slider(
            max: maxduration,
            min: mindurration,
            onChanged: (value) {
              setState(() {
                curduration = value;
              });
            },
            value: curduration,
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  setaudio();
                });
              },
              icon: Icon(CupertinoIcons.play)),
        ],
      ),
    );
  }

  bool isplay = false;
  bool isloading = false;
  bool isRepeating = false;
  void setaudio() async {
    await player.setAsset("audio/mixkit-deep-urban-623.mp3");
    await player.load();
    curduration = mindurration;
    maxduration = player.duration!.inMicroseconds.toDouble();
    setState(() {
      curentime = getDuration(currentDuration) as String;
      endtime = getDuration(mindurration) as String;
    });
    isplay = false;
    changestatusplay();
    player.positionStream.listen((event) {
      curduration = event.inMilliseconds.toDouble();
      setState(() {
        curentime = getDuration(currentDuration) as String;
      });
    });
    setState(() {
      isloading = false;
    });
    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          currentDuration = mindurration;
          if (isRepeating == true) {
            isplay = true;
          } else {
            isplay = false;
            isRepeating = false;
          }
        });
      }
    });
  }

  List<int> getDuration(double currentDuration) {
    Duration duration = Duration(microseconds: currentDuration.round());
    return [duration.inHours, duration.inMinutes, duration.inSeconds];
  }

  void changestatusplay() {
    setState(() {
      isplay = !isplay;
    });
    isplay ? player.play() : player.pause();
    curduration == maxduration ? isplay : !isplay;
  }
}
