import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/helpers/human_formats.dart';
import '../../../../domain/entities/content_entity.dart';

class VideoButtons extends StatelessWidget {

  final Content video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(video.user.image != "" ? video.user.image : ""),
            ),
            Text(video.user.username),
          ],
        ),
        _CustomIconButton(value: video.likes, icono: Icons.favorite, iconColor: Colors.red),
        const SizedBox(height: 20),
        _CustomIconButton(value: video.views, icono: Icons.remove_red_eye_outlined,),
        const SizedBox(height: 20),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 2),
          child: const _CustomIconButton(value: 0, icono: Icons.play_circle_outline, link: '/audios')
        ),
      ],
    );
  }
}


class _CustomIconButton extends StatelessWidget {

  final int value;
  final IconData icono;
  final Color? color;
  final String link;

  const _CustomIconButton({required this.value, required this.icono, iconColor, this.link = ""})
  :color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton( 
          onPressed: () => {
            if (link.contains("audios")) context.push(link)
          },
          icon: Icon(icono, color: color, size: 40),
        ),
        if (value > 0)
          Text(HumanFormats.humanReadbleNumber(value.toDouble())),
      ],
    );
  }
}