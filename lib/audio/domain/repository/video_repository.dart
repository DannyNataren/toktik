

import '../entity/audio_entity.dart';

abstract class AudioRepository {
  Future<List<Audio>> getAudios();
}