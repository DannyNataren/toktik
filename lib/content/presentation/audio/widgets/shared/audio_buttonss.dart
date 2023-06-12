import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toktik_clean/config/helpers/human_formats.dart';
import 'package:toktik_clean/content/domain/entities/content_entity.dart';

class AudioButtons extends StatelessWidget {

  final Content audio;

  const AudioButtons({super.key, required this.audio});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(audio.user.image != "" ? audio.user.image : "https://freesvg.org/img/abstract-user-flat-1.png"),
            ),
            Text(audio.user.username),
          ],
        ),
        _CustomIconButton(value: audio.likes, icono: Icons.favorite, iconColor: Colors.red, link: '/',),
        const SizedBox(height: 20),
        _CustomIconButton(value: audio.views, icono: Icons.remove_red_eye_outlined, link: '/images',),
        const SizedBox(height: 20),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 2),
          child: const _CustomIconButton(value: 0, icono: Icons.play_circle_outline, link: '/audios',)
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

  const _CustomIconButton({required this.value, required this.icono, iconColor, required this.link})
  :color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () => context.push(link),
          icon: Icon(icono, color: color, size: 40),
        ),
        if (value > 0)
          Text(HumanFormats.humanReadbleNumber(value.toDouble())),
      ],
    );
  }
}