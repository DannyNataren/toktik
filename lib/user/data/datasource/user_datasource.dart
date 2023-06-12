import 'package:dio/dio.dart';
import 'package:toktik_clean/user/data/models/user_model.dart';
import 'package:toktik_clean/user/domain/entities/user_entity.dart';

abstract class UserDataSource {
  Future<List<User>> getUsers();
  Future<User> getById(int userId);
  Future<User> createContent(User user);
  Future<User> login(String userName, String password);
  Future<String> deleteContent(int userId);
}

class UserDataSourceImpl implements UserDataSource {
  final _dio = Dio();
  @override
  Future<User> createContent(User user) async{
    final response = await _dio.post("http://18.214.245.88/user/", data: user);
    final jsonResponse = response.data;
    final newVideo = jsonResponse.map((e) => UserModel.fromJson(e).toUserEntity());
    return newVideo;
  }

  @override
  Future<String> deleteContent(int userId) async{
    final response = await _dio.delete("http://18.214.245.88/user/$userId",);
    final jsonResponse = response.data;
    return jsonResponse;
  }

  @override
  Future<User> getById(int userId) async{
    final response = await _dio.get("http://18.214.245.88/user/$userId");
    final jsonResponse = response.data;
    final newVideo = jsonResponse.map((e) => UserModel.fromJson(e).toUserEntity());
    return newVideo;
  }

  @override
  Future<List<User>> getUsers() async{
    final response = await _dio.get("http://18.214.245.88/user/");
    final jsonResponse = response.data as List<dynamic>;
    final newVideos = jsonResponse.map((e) => UserModel.fromJson(e).toUserEntity()).toList();
    return newVideos;
  }
  
  @override
  Future<User> login(String userName, String password) async{
    final response = await _dio.post("http://18.214.245.88/user/", data: {userName, password});
    final jsonResponse = response.data;
    final newVideo = jsonResponse.map((e) => UserModel.fromJson(e).toUserEntity());
    return newVideo;
  }

}