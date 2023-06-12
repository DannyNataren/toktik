
import 'package:toktik_clean/content/domain/entities/content_entity.dart';
import 'package:toktik_clean/content/domain/repositories/content_repository.dart';

class ContentUseCases {
  final ContentRepository videoRepository;
  ContentUseCases(this.videoRepository);
  Future<List<Content>> getcontent(String type) async {
    return await videoRepository.getContent(type);
  }
  Future<Content> getByPublicId(String publicId) async {
    return await videoRepository.getByPublicId(publicId);
  }
  Future<Content> create(Content content) async {
    return videoRepository.createContent(content);
  }
  Future<String> delete(String publicId) async {
    return videoRepository.deleteContent(publicId);
  }
}