import 'package:flutter/material.dart';
import 'package:toktik_clean/content/domain/entities/content_entity.dart';
import 'package:toktik_clean/content/presentation/audio/widgets/shared/audio_buttonss.dart';
import 'package:toktik_clean/content/presentation/audio/widgets/videos/full_screen_video.dart';


class AudioScrollableView extends StatelessWidget {

  final List<Content> audios;

  const AudioScrollableView({super.key, required this.audios});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: audios.length,
      itemBuilder: (context, index) {
        final Content audioList = audios[index];
        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenAudioPlayer(caption: audioList.caption, videoUrl: audioList.url,),
            ),
            Positioned(
              bottom: 40,
              right: 20,
              child: AudioButtons(audio: audioList,),
            )
          ],
        );
      },
    );
  }
}