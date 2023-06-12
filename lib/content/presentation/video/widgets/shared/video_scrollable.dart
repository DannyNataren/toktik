import 'package:flutter/material.dart';
import 'package:toktik_clean/content/presentation/video/widgets/shared/video_buttonss.dart';

import '../../../../domain/entities/content_entity.dart';
import '../videos/full_screen_video.dart';

class VideoScrollableView extends StatelessWidget {

  final List<Content> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final Content videoPost = videos[index];
        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(caption: videoPost.caption, videoUrl: videoPost.url,),
            ),
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost),
            )
          ],
        );
      },
    );
  }
}