import 'package:go_router/go_router.dart';
import 'package:toktik_clean/content/presentation/video/video_index.dart';
import 'package:toktik_clean/user/presentation/login/login_screen.dart';
import 'package:toktik_clean/user/presentation/register/register_screen.dart';

import '../content/presentation/audio/audio_index.dart';



final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder:  (context, state) =>  LoginScreen()//const VideoIndex(),
    ),
    GoRoute(
      path: '/audios',
      builder:  (context, state) => const AudioIndex(),
    ),
  ],
);