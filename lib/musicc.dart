import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Mymusic extends StatefulWidget {
  const Mymusic({super.key});

  @override
  State<Mymusic> createState() => _MymusicState();
}

class _MymusicState extends State<Mymusic> with WidgetsBindingObserver {
  final player = AudioPlayer(); // Create a player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playmusic();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        print('===>appLifeCycleState inactive');
        break;
      case AppLifecycleState.resumed:
        print('===?appLifeCycleState resumed');
        break;
      case AppLifecycleState.paused:
        print('===!appLifeCycleState paused');
        break;
      case AppLifecycleState.detached:
        print('====appLifeCycleState detech');
      // TODO: Handle this case.
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
        print('====appLifeCycleState hidden');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                player.pause();
              });
            },
            child: Text('play'))
      ]),
    );
  }

  int? len;
  Future<void> playmusic() async {
    await player.setAsset("audio/mixkit-deep-urban-623.mp3");
    await player.load();
    len = player.load().toString().length;

    await player.play();
    player.setLoopMode(LoopMode.one);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
