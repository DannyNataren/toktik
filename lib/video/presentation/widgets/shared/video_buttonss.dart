import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../config/helpers/human_formats.dart';
import '../../../domain/entity/video_entity.dart';

class VideoButtons extends StatelessWidget {

  final Video video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(value: video.likes, icono: Icons.favorite, iconColor: Colors.red),
        const SizedBox(height: 20),
        _CustomIconButton(value: video.views, icono: Icons.remove_red_eye_outlined),
        const SizedBox(height: 20),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 2),
          child: const _CustomIconButton(value: 0, icono: Icons.play_circle_outline)
        ),
      ],
    );
  }
}


class _CustomIconButton extends StatelessWidget {

  final int value;
  final IconData icono;
  final Color? color;

  const _CustomIconButton({super.key, required this.value, required this.icono, iconColor})
  :color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {

          },
          icon: Icon(icono, color: color, size: 40),
        ),
        if (value > 0)
          Text(HumanFormats.humanReadbleNumber(value.toDouble())),
      ],
    );
  }
}