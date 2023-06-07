import '../../domain/entity/video_entity.dart';

class VideoModel {
    final String originalName;
    final String name;
    final String caption;
    final int likes;
    final int views;
    final String url;
    final String type;

    VideoModel({
        this.likes = 0,
        this.views = 0,
        required this.originalName,
        required this.name,
        required this.caption,
        required this.url,
        required this.type
        
    });

    factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        originalName: json["originalName"],
        name: json["name"],
        caption: json["caption"],
        likes: json["likes"],
        views: json["views"],
        url: json["url"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "originalName": originalName,
        "name": name,
        "caption": caption,
        "likes": likes,
        "views": views,
        "url": url,
        "type": type
    };

    Video toVideoPostEntity() => Video(originalName: originalName, name: name, caption: caption, likes: likes, views: views, url: url, type: type);
}
