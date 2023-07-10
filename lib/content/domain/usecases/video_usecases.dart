
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
  Future<void> create(String file, int idUser, String type) async {
    return videoRepository.createContent(file, idUser, type);
  }
  Future<String> delete(String publicId) async {
    return videoRepository.deleteContent(publicId);
  }
}