
import '../../../data/local_video_post.dart';
import '../../domain/entity/video_entity.dart';
import '../models/video_model.dart';

abstract class VideoDataSource {
  Future<List<Video>> getVideos();
}


class VideoDataSourceImpl implements VideoDataSource{
  
  @override
  Future<List<Video>> getVideos() async{
    await Future.delayed( const Duration(seconds: 2) );

    final List<Video> newVideos = videoPosts.map( (video) => VideoModel.fromJson(video).toVideoPostEntity() ).toList();

    return newVideos;
  }

}