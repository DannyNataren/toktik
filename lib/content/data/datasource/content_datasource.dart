
import 'package:dio/dio.dart';

import '../../domain/entities/content_entity.dart';
import '../models/content_model.dart';

abstract class ContentDataSource {
  Future<List<Content>> getContent(String type);
  Future<Content> getByPublicId(String type);
  Future<Content> createContent(Content content);
  Future<String> deleteContent(String publicId);
}


class ContentDataSourceImpl implements ContentDataSource{
  final _dio = Dio();
  @override
  Future<List<Content>> getContent(String type) async{
    final response = await _dio.get("http://18.214.245.88/content/$type");
    final jsonResponse = response.data as List<dynamic>;
    final newVideos = jsonResponse.map((e) => ContentModel.fromJson(e).toContentEntity()).toList();

    return newVideos;
  }
  
  @override
  Future<Content> getByPublicId(String publicId) async{

    final response = await _dio.get("http://18.214.245.88/content/$publicId");
    final jsonResponse = response.data;
    final newVideo = jsonResponse.map((e) => ContentModel.fromJson(e).toContentEntity());

    return newVideo;
  }
  
  @override
  Future<Content> createContent(Content content) async{
    final response = await _dio.post("http://18.214.245.88/content/", data: content);
    final jsonResponse = response.data;
    final newVideo = jsonResponse.map((e) => ContentModel.fromJson(e).toContentEntity());
    return newVideo;
  }
  
  @override
  Future<String> deleteContent(String publicId) async{
    final response = await _dio.delete("http://18.214.245.88/content/$publicId",);
    final jsonResponse = response.data;
    return jsonResponse;
  }

}