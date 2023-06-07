import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_clean/video/data/datasource/video_datasource.dart';
import 'package:toktik_clean/video/data/repositories/video_repositoryImpl.dart';
import 'package:toktik_clean/video/domain/usecases/video_usecases.dart';
import 'package:toktik_clean/video/presentation/providers/discover_provider.dart';
import 'package:toktik_clean/video/presentation/screens/discover/discover_screen.dart';

class VideoIndex extends StatelessWidget {
  const VideoIndex({super.key});

  @override
  Widget build(BuildContext context) {
    final videoDatasource = VideoDataSourceImpl();
    final videoRepository = VideoRepositoryImpl(videoDataSource: videoDatasource);
    final videoUseCases = VideoUseCases(videoRepository);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiscoverProvider(videoUseCases: videoUseCases)..loadNextPAge())
      ],
      child: const DiscoverScreen(),
    );
  }
}