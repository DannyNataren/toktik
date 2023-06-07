import '../../domain/entity/audio_entity.dart';
import '../../domain/repository/video_repository.dart';
import '../datasource/audio_datasource.dart';

class AudioRepositoryImpl implements AudioRepository {
    final AudioDataSource audioDataSource;
    AudioRepositoryImpl({required this.audioDataSource});
  @override
  Future<List<Audio>> getAudios() async{
    return await audioDataSource.getAudios();
  }

}