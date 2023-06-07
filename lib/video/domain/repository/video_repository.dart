import 'package:toktik_clean/video/domain/entity/video_entity.dart';

abstract class VideoRepository {
  Future<List<Video>> getVideos();
}