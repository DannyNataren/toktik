import 'package:toktik_clean/content/domain/entities/content_entity.dart';

abstract class ContentRepository {
  Future<List<Content>> getContent(String type);
  Future<Content> getByPublicId(String publicId);
  Future<Content> createContent(Content content);
  Future<String> deleteContent(String publicId);
}