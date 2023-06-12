import '../../domain/entities/content_entity.dart';

class ContentModel {
  ContentModel({
    this.likes = 0,
    this.views = 0,
    required this.id,
    required this.originalName,
    required this.name,
    required this.caption,
    required this.url,
    required this.type,
    required this.user,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      id: json["id"],
      originalName: json["originalName"],
      name: json["name"],
      caption: json["caption"],
      likes: json["likes"],
      views: json["views"],
      url: json["url"],
      type: json["type"],
      user: UserContentModel.fromJson(json["user"]),
    );
  }

  final String caption;
  final int id;
  final int likes;
  final String name;
  final String originalName;
  final String type;
  final String url;
  final int views;
  final UserContentModel user;

  Map<String, dynamic> toJson() => {
        "originalName": originalName,
        "name": name,
        "caption": caption,
        "likes": likes,
        "views": views,
        "url": url,
        "type": type,
        "user": user.toJson(),
      };

  Content toContentEntity() => Content(
        id: id,
        originalName: originalName,
        name: name,
        caption: caption,
        likes: likes,
        views: views,
        url: url,
        type: type,
        user: user.toUserContentEntity(),
      );
}

class UserContentModel {
  UserContentModel({
    required this.id,
    required this.username,
    required this.image,
  });

  factory UserContentModel.fromJson(Map<String, dynamic> json) {
    return UserContentModel(
      id: json["id"],
      username: json["username"],
      image: json["image"]
    );
  }

  final int id;
  final String username;
  final String image;

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "image": image
      };

      UserContent toUserContentEntity() => UserContent(
        id: id,
        username: username,
        image: image
      );
}