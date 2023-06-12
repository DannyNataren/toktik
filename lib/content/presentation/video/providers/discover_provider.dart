import 'package:flutter/widgets.dart';
import 'package:toktik_clean/content/domain/usecases/video_usecases.dart';

import '../../../domain/entities/content_entity.dart';


class DiscoverProvider extends ChangeNotifier {
  final ContentUseCases videoUseCases;
  bool initialLoading = true;
  List<Content> videoList = [];

  DiscoverProvider({required this.videoUseCases});

  Future<void> loadNextPAge() async{

    // await Future.delayed( const Duration(seconds: 2) );

    // final List<VideoPost> newVideos = videoPosts.map( (video) => VideoPostModel.fromJson(video).toVideoPostEntity() ).toList();

    final newVideos = await videoUseCases.getcontent("video");

    videoList.addAll(newVideos);

    initialLoading = false;

    notifyListeners();
  }

}