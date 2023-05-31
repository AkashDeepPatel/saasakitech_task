import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'audio_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final AudioController audioController = Get.put(AudioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Saasaki Tech"),
          backgroundColor: Colors.purpleAccent.withOpacity(0.5),
        ),
        body: ListView.builder(
          itemCount: audioController.audioPaths.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text('Audio ${index + 1}'),
                leading: const Icon(Icons.music_note),
                trailing: Obx(()=>Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.play_arrow),
                      color: audioController.isPlaying[index].value==1?Colors.purpleAccent.withOpacity(0.5):null,
                      onPressed: () => audioController.play(index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.pause),
                      color: audioController.isPlaying[index].value==2?Colors.purpleAccent.withOpacity(0.5):null,
                      onPressed: () => audioController.pause(index),
                    ),
                  ],
                ),)
            );
          },
        )
    );
  }
}
