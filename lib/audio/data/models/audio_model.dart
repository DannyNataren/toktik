
import '../../domain/entity/audio_entity.dart';

class AudioModel {
    final int id;
    final String originalName;
    final String name;
    final String caption;
    final String url;
    final String type;

    AudioModel({
        required this.id,
        required this.originalName,
        required this.name,
        required this.caption,
        required this.url,
        required this.type
        
    });

    factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
        id: json["id"],
        originalName: json["originalName"],
        name: json["name"],
        caption: json["caption"],
        url: json["url"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "originalName": originalName,
        "name": name,
        "caption": caption,
        "url": url,
        "type": type
    };

    Audio toAudioPostEntity() => Audio(id: id, originalName: originalName, name: name, caption: caption, url: url, type: type);
}