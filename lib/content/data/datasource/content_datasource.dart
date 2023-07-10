
import 'package:dio/dio.dart';

import '../../domain/entities/content_entity.dart';
import '../models/content_model.dart';

abstract class ContentDataSource {
  Future<List<Content>> getContent(String type);
  Future<Content> getByPublicId(String type);
  Future<void> createContent(String file, int idUser, String type);
  Future<String> deleteContent(String publicId);
}


class ContentDataSourceImpl implements ContentDataSource{
  final _dio = Dio();
  @override
  Future<List<Content>> getContent(String type) async{
    final response = await _dio.get("http://3.219.102.75/content/$type");
    final jsonResponse = response.data as List<dynamic>;
    final newVideos = jsonResponse.map((e) => ContentModel.fromJson(e).toContentEntity()).toList();

    return newVideos;
  }
  
  @override
  Future<Content> getByPublicId(String publicId) async{

    final response = await _dio.get("http://3.219.102.75/content/$publicId");
    final jsonResponse = response.data;
    final newVideo = jsonResponse.map((e) => ContentModel.fromJson(e).toContentEntity());

    return newVideo;
  }
  
  @override
  Future<void> createContent(String file, int idUser, String type) async{
    FormData formData = FormData();
    formData.fields.add(MapEntry('idUser', "${idUser}"));
    formData.fields.add(MapEntry('caption', "Nuevo ${type}"));
    formData.fields.add(MapEntry('likes', "716151"));
    formData.fields.add(MapEntry('views', "8762"));
    formData.files.add(MapEntry(
      'content',
      await MultipartFile.fromFile(file),
    ));

    await _dio.post("http://3.219.102.75/content/", data: formData);
  }
  
  @override
  Future<String> deleteContent(String publicId) async{
    final response = await _dio.delete("http://3.219.102.75/content/$publicId",);
    final jsonResponse = response.data;
    return jsonResponse;
  }

}