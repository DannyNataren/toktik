

import '../entity/audio_entity.dart';
import '../repository/video_repository.dart';

class AudioUseCases {
  final AudioRepository audioRepository;
  AudioUseCases(this.audioRepository);
  Future<List<Audio>> getAudios() async {
    return await audioRepository.getAudios();
  }
}