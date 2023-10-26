import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:drugenius/Paginas/nav_audios/audios.dart';
import 'package:drugenius/Paginas/nav_audios/class/audio_player_manager4.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioManager4 extends StatefulWidget {
  const AudioManager4({Key? key}) : super(key: key);

  @override
  State<AudioManager4> createState() => _AudioManager4();
}

class _AudioManager4 extends State<AudioManager4> {
  late AudioPlayerManager manager;

  @override
  void initState() {
    super.initState();
    manager = AudioPlayerManager();
    manager.init();
  }

  @override
  void dispose() {
    manager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FullExample(audioPlayerManager: manager);
  }
}

class FullExample extends StatefulWidget {
  const FullExample({
    Key? key,
    required this.audioPlayerManager,
  }) : super(key: key);

  final AudioPlayerManager audioPlayerManager;

  @override
  State<FullExample> createState() => _FullExampleState();
}

class _FullExampleState extends State<FullExample> {
  @override
  void initState() {
    super.initState();
    widget.audioPlayerManager.init();
  }

  @override
  void dispose() {
    widget.audioPlayerManager.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Row(
          children: [
            const Text(
              "Reproductor de audio",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 22, 112, 177),
        elevation: 0,
        actions: <Widget>[],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            dispose();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Audios()));
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(
              'https://i.ibb.co/YfQmF2P/Dise-o-Podcast.png',
            ),
            const SizedBox(height: 45),
            const Text(
              'Episodio 4',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'La importancia de Farmacologia ',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'Drugenius',
              style: TextStyle(fontSize: 20),
            ),
            _progressBar(),
            _playButton(),
          ],
        ),
      ),
    );
  }

  StreamBuilder<DurationState> _progressBar() {
    return StreamBuilder<DurationState>(
      stream: widget.audioPlayerManager.durationState,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: widget.audioPlayerManager.player.seek,
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
        );
      },
    );
  }

  StreamBuilder<PlayerState> _playButton() {
    return StreamBuilder<PlayerState>(
      stream: widget.audioPlayerManager.player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 32.0,
            height: 32.0,
            child: const CircularProgressIndicator(),
          );
        } else if (playing != true) {
          return IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 32.0,
            onPressed: widget.audioPlayerManager.player.play,
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 32.0,
            onPressed: widget.audioPlayerManager.player.pause,
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 32.0,
            onPressed: () =>
                widget.audioPlayerManager.player.seek(Duration.zero),
          );
        }
      },
    );
  }
}
