import 'package:go_router/go_router.dart';
import 'package:toktik_clean/video/presentation/video_index.dart';



final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder:  (context, state) => const VideoIndex(),
    )
  ],
);