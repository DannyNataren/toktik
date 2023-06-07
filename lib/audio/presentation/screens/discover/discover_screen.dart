import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../audio/presentation/providers/discover_provider.dart';
import '../../../../audio/presentation/widgets/shared/audio_scrollable.dart';




class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});
  @override
  Widget build(BuildContext context){
    
    final discoverProvider = context.watch<DiscoverProvider>();
    

    return Scaffold(
      body: discoverProvider.initialLoading ? 
        const Center(
          child: CircularProgressIndicator(strokeWidth: 2,),
        ) : 
        AudioScrollableView(audios: discoverProvider.audioList),
    );
  }
}