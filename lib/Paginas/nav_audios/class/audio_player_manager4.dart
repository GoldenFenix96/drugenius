import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

const url = 'https://www.cjoint.com/doc/23_10/MJlf2xucaSF_Episodio4.mp3';



class AudioPlayerManager {
 
  Stream<DurationState>? durationState;
  final player = AudioPlayer();
  void init() {
    durationState = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
        player.positionStream,
        player.playbackEventStream,
        (position, playbackEvent) => DurationState(
              progress: position,
              buffered: playbackEvent.bufferedPosition,
              total: playbackEvent.duration,
            ));
    player.setUrl(url);
    
  }

  void dispose() {
    player.dispose();
  }
}

class DurationState {
  const DurationState({
    required this.progress,
    required this.buffered,
    this.total,
  });
  final Duration progress;
  final Duration buffered;
  final Duration? total;
}