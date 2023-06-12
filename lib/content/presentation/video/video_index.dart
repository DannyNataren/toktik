import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_clean/content/data/datasource/content_datasource.dart';
import 'package:toktik_clean/content/data/repositories/content_repository_impl.dart';
import 'package:toktik_clean/content/domain/usecases/video_usecases.dart';
import 'package:toktik_clean/content/presentation/video/providers/discover_provider.dart';
import 'package:toktik_clean/content/presentation/video/screens/discover/discover_screen.dart';

class VideoIndex extends StatelessWidget {
  const VideoIndex({super.key});

  @override
  Widget build(BuildContext context) {
    final videoDatasource = ContentDataSourceImpl();
    final videoRepository = ContentRepositoryImpl(videoDataSource: videoDatasource);
    final videoUseCases = ContentUseCases(videoRepository);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiscoverProvider(videoUseCases: videoUseCases)..loadNextPAge())
      ],
      child: const DiscoverScreen(),
    );
  }
}