import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class JustAudioWidget extends StatefulWidget {

  const JustAudioWidget({super.key});

  @override
  State<StatefulWidget> createState() => _JustAudioState();
}

class _JustAudioState extends State<JustAudioWidget> {

  final audioPlayer = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void _audioPlay() async {
    await audioPlayer.setAsset("assets/audios/t-rex-roar.mp3");
    audioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _audioPlay();
        },
        child: const Text("t-rex-roar.mp3"),
    );
  }

}