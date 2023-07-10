
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_clean/config/theme/app_theme.dart';
import 'package:toktik_clean/content/data/datasource/content_datasource.dart';
import 'package:toktik_clean/content/data/repositories/content_repository_impl.dart';
import 'package:toktik_clean/content/domain/usecases/video_usecases.dart';
import 'package:toktik_clean/content/presentation/audio/providers/discover_provider.dart';
import 'package:toktik_clean/content/presentation/video/providers/discover_provider.dart';
import 'package:toktik_clean/router/router.dart';

class HomeRouter extends StatelessWidget {
  const HomeRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final videoDatasource = ContentDataSourceImpl();
    final videoRepository = ContentRepositoryImpl(videoDataSource: videoDatasource);
    final videoUseCases = ContentUseCases(videoRepository);
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiscoverProvider(videoUseCases: videoUseCases)..loadNextPAge()),
        ChangeNotifierProvider(create: (_) => DiscoverAudioProvider(contentUseCases: videoUseCases)..loadNextPAge(),)
      ],
      child: MaterialApp.router(
        title: 'toktik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        routerConfig: appRouter,
      ),
    );
  }
}