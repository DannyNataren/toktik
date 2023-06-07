
import 'package:toktik_clean/video/domain/entity/video_entity.dart';
import 'package:toktik_clean/video/domain/repository/video_repository.dart';

class VideoUseCases {
  final VideoRepository videoRepository;
  VideoUseCases(this.videoRepository);
  Future<List<Video>> getVideos() async {
    return await videoRepository.getVideos();
  }
}