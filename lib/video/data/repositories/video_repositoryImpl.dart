import 'package:toktik_clean/video/data/datasource/video_datasource.dart';
import 'package:toktik_clean/video/domain/entity/video_entity.dart';
import 'package:toktik_clean/video/domain/repository/video_repository.dart';

class VideoRepositoryImpl implements VideoRepository {
    final VideoDataSource videoDataSource;
    VideoRepositoryImpl({required this.videoDataSource});
  @override
  Future<List<Video>> getVideos() async{
    return await videoDataSource.getVideos();
  }

}