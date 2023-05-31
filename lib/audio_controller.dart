import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioController extends GetxController {
  List<AudioPlayer> players = [];
  List<RxInt> isPlaying = [3.obs, 3.obs, 3.obs];
  List<String> audioPaths = [
    'audios/audio1.mp3',
    'audios/audio2.mp3',
    'audios/audio3.mp3',
  ];

  @override
  void onInit() {
    super.onInit();
    initializePlayers();
  }

  Future<void> initializePlayers() async {
    for (String path in audioPaths) {
      AudioPlayer player = AudioPlayer();
      await player.setSourceAsset(path);
      players.add(player);
    }
  }

  void play(int index) {
    debugPrint(index.toString());
    players[index].resume();
    isPlaying[index].value = 1;
  }

  void pause(int index) {
    players[index].pause();
    isPlaying[index].value = 2;
  }
}
