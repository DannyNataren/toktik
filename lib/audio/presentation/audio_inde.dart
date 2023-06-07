import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../audio/presentation/providers/discover_provider.dart';
import '../../audio/presentation/screens/discover/discover_screen.dart';
import '../data/datasource/audio_datasource.dart';
import '../data/repositories/audio_repositoryImpl.dart';
import '../domain/usescases/audio_usecases.dart';

class AudioIndex extends StatelessWidget {
  const AudioIndex({super.key});

  @override
  Widget build(BuildContext context) {
    final audioDatasource = AudioDataSourceImpl();
    final audioRepository = AudioRepositoryImpl(audioDataSource: audioDatasource);
    final audioUseCases = AudioUseCases(audioRepository);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiscoverProvider(audioUseCases: audioUseCases)..loadNextPAge())
      ],
      child: const DiscoverScreen(),
    );
  }
}