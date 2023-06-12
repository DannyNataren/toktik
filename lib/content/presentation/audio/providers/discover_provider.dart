import 'package:flutter/widgets.dart';
import 'package:toktik_clean/content/domain/entities/content_entity.dart';
import 'package:toktik_clean/content/domain/usecases/video_usecases.dart';

class DiscoverAudioProvider extends ChangeNotifier {
  final ContentUseCases contentUseCases;
  bool initialLoading = true;
  List<Content> videoList = [];

  DiscoverAudioProvider({required this.contentUseCases});

  Future<void> loadNextPAge() async{

    // await Future.delayed( const Duration(seconds: 2) );

    // final List<VideoPost> newVideos = videoPosts.map( (video) => VideoPostModel.fromJson(video).toVideoPostEntity() ).toList();

    final newVideos = await contentUseCases.getcontent("audio");

    videoList.addAll(newVideos);

    initialLoading = false;

    notifyListeners();
  }

}