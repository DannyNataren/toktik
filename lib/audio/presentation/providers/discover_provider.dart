


import 'package:flutter/widgets.dart';
import '../../domain/entity/audio_entity.dart';
import '../../domain/usescases/audio_usecases.dart';

class DiscoverProvider extends ChangeNotifier {
  final AudioUseCases audioUseCases;
  bool initialLoading = true;
  List<Audio> audioList = [];

  DiscoverProvider({required this.audioUseCases});

  Future<void> loadNextPAge() async{

    // await Future.delayed( const Duration(seconds: 2) );

    // final List<VideoPost> newVideos = videoPosts.map( (video) => VideoPostModel.fromJson(video).toVideoPostEntity() ).toList();

    final newAudios = await audioUseCases.getAudios();

    audioList.addAll(newAudios);

    initialLoading = false;

    notifyListeners();
  }

}