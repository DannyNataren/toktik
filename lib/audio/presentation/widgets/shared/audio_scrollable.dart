import 'package:flutter/material.dart';



import '../../../domain/entity/audio_entity.dart';
import '../audios/full_screen_audio.dart';



class AudioScrollableView extends StatelessWidget {

  final List<Audio> audios;

  const AudioScrollableView({super.key, required this.audios});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: audios.length,
      itemBuilder: (context, index) {
        final Audio audioPost = audios[index];
        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(caption: audioPost.caption, audioUrl: audioPost.url,),
            ),
            // Positioned(
            //   bottom: 40,
            //   right: 20,
            //   child: VideoButtons(video: audioPost),
            // )
          ],
        );
      },
    );
  }
}