import 'package:toktik_clean/content/domain/entities/content_entity.dart';

abstract class ContentRepository {
  Future<List<Content>> getContent(String type);
  Future<Content> getByPublicId(String publicId);
  Future<void> createContent(String file, int idUser, String type);
  Future<String> deleteContent(String publicId);
}