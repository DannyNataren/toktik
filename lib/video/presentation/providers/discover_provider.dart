import 'package:flutter/widgets.dart';
import 'package:toktik_clean/video/domain/usecases/video_usecases.dart';

import '../../domain/entity/video_entity.dart';


class DiscoverProvider extends ChangeNotifier {
  final VideoUseCases videoUseCases;
  bool initialLoading = true;
  List<Video> videoList = [];

  DiscoverProvider({required this.videoUseCases});

  Future<void> loadNextPAge() async{

    // await Future.delayed( const Duration(seconds: 2) );

    // final List<VideoPost> newVideos = videoPosts.map( (video) => VideoPostModel.fromJson(video).toVideoPostEntity() ).toList();

    final newVideos = await videoUseCases.getVideos();

    videoList.addAll(newVideos);

    initialLoading = false;

    notifyListeners();
  }

}