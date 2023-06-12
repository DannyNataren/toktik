import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik_clean/content/presentation/audio/providers/discover_provider.dart';
import 'package:toktik_clean/content/presentation/audio/widgets/shared/audio_scrollable.dart';


class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});
  @override
  Widget build(BuildContext context){
    
    final discoverProvider = context.watch<DiscoverAudioProvider>();
    

    return Scaffold(
      body: discoverProvider.initialLoading ? 
        const Center(
          child: CircularProgressIndicator(strokeWidth: 2,),
        ) : 
        AudioScrollableView(audios: discoverProvider.videoList),
    );
  }
}