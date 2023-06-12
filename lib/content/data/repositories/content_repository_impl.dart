import 'package:toktik_clean/content/data/datasource/content_datasource.dart';
import 'package:toktik_clean/content/domain/entities/content_entity.dart';
import 'package:toktik_clean/content/domain/repositories/content_repository.dart';

class ContentRepositoryImpl implements ContentRepository {
    final ContentDataSource videoDataSource;
    ContentRepositoryImpl({required this.videoDataSource});
  @override
  Future<List<Content>> getContent(String type) async{
    return await videoDataSource.getContent(type);
  }
  
  @override
  Future<Content> getByPublicId(String publicId) async{
    return await videoDataSource.getByPublicId(publicId);
  }
  
  @override
  Future<Content> createContent(Content content) async{
    return await videoDataSource.createContent(content);
  }
  
  @override
  Future<String> deleteContent(String publicId) async{
    return await videoDataSource.deleteContent(publicId);
  }

}