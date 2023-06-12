import 'package:go_router/go_router.dart';
import 'package:toktik_clean/content/presentation/video/video_index.dart';

import '../content/presentation/audio/audio_index.dart';



final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder:  (context, state) => const VideoIndex(),
    ),
    GoRoute(
      path: '/audios',
      builder:  (context, state) => const AudioIndex(),
    ),
  ],
);