


import '../../../../data/local_audio_post.dart';
import '../../domain/entity/audio_entity.dart';
import '../models/audio_model.dart';

abstract class AudioDataSource {
  Future<List<Audio>> getAudios();
}

class AudioDataSourceImpl implements AudioDataSource{
  
  @override
  Future<List<Audio>> getAudios() async{
    await Future.delayed( const Duration(seconds: 2) );

    final List<Audio> newAudios = audioPosts.map( (audio) => AudioModel.fromJson(audio).toAudioPostEntity() ).toList();

    return newAudios;
  }

}