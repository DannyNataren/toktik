
import 'package:toktik_clean/user/domain/entities/user_entity.dart';

class UserModel {

  UserModel({
    required this.image,
    required this.id,
    required this.username,
    required this.password,
    required this.name,
    required this.lastName,
    required this.createdAt,
    required this.isActive,
    required this.content,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
  return UserModel(
    image: json['image'],
    id: json['id'],
    username: json['username'],
    password: json['password'],
    name: json['name'],
    lastName: json['last_name'],
    createdAt: DateTime.parse(json['createdAt']),
    isActive: json['isActive'],
    content: List<ContenUserModel>.from(json['content'].map((contentJson) => ContenUserModel.fromJson(contentJson))).toList(),
  );
}

  final String image;
  final int id;
  final String username;
  final String password;
  final String name;
  final String lastName;
  final DateTime createdAt;
  final bool isActive;
  final List<ContenUserModel> content;

  Map<String, dynamic> toJson() => {
    "image":image,
    "id": id,
    "username": username,
    "password": password,
    "name": name,
    "lastName": lastName,
    "createdAt": createdAt,
    "isActive": isActive,
    "content": content.map((e) => e.toJson()),
  };

  User toUserEntity() => User(
    image: image,
    id: id,
    username: username,
    password: password,
    name: name,
    lastName: lastName,
    createdAt: createdAt,
    isActive: isActive,
    content: content.map((e) => e.toContentUserEntity()).toList()  );
}

class ContenUserModel {
  final int id;
  final String originalName;
  final String name;
  final String caption;
  final int likes;
  final int views;
  final String url;
  final String type;
  final String publicId;

  ContenUserModel({
    required this.id,
    required this.originalName,
    required this.name,
    required this.caption,
    required this.likes,
    required this.views,
    required this.url,
    required this.type,
    required this.publicId,
  });

  factory ContenUserModel.fromJson(Map<String, dynamic> json) {
    return ContenUserModel(
      id: json['id'],
      originalName: json['originalName'],
      name: json['name'],
      caption: json['caption'],
      likes: json['likes'],
      views: json['views'],
      url: json['url'],
      type: json['type'],
      publicId: json['publicId'],
    );
  }
  Map<String, dynamic> toJson() => {
    "id": id,
  	"originalName": originalName,
  	"name": name,
  	"caption": caption,
  	"likes": likes,
  	"views": views,
  	"url": url,
  	"type": type,
  	"publicId": publicId
  };
  ContentUser toContentUserEntity() => ContentUser(id: id, originalName: originalName, name: name, caption: caption, likes: likes, views: views, url: url, type: type, publicId: publicId);
}
