import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_clean/content/data/datasource/content_datasource.dart';
import 'package:toktik_clean/content/data/repositories/content_repository_impl.dart';
import 'package:toktik_clean/content/domain/usecases/video_usecases.dart';
import 'package:toktik_clean/content/presentation/audio/providers/discover_provider.dart';
import 'package:toktik_clean/content/presentation/audio/screens/discover/discover_screen.dart';


class AudioIndex extends StatelessWidget {
  const AudioIndex({super.key});

  @override
  Widget build(BuildContext context) {
    final videoDatasource = ContentDataSourceImpl();
    final videoRepository = ContentRepositoryImpl(videoDataSource: videoDatasource);
    final videoUseCases = ContentUseCases(videoRepository);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiscoverAudioProvider(contentUseCases: videoUseCases)..loadNextPAge())
      ],
      child: const AudioScreen(),
    );
  }
}