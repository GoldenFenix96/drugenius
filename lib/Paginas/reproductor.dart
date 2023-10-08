import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class DesingExample extends StatefulWidget {
  const DesingExample({super.key});

  @override
  State<DesingExample> createState() => _DesingExampleState();
}

class _DesingExampleState extends State<DesingExample> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  final SwiperController swiperController = SwiperController();
  double screenWidth = 0;
  double screenHeight = 0;
  Color highlightColor = const Color(0xff35738a);
  List<Audio> audioList = [
    Audio('assets/audio/Episodio1.mp3',
        metas: Metas(
            title: 'Episodio 1: Emprendimiento',
            artist: 'Drugenius',
            image: const MetasImage.asset('assets/images/anato.jpg'))),
    Audio('assets/audio/Episodio2.mp3',
        metas: Metas(
            title: 'Episodio 2: Lagrimas y risas en farmacologia',
            artist: 'Drugenius',
            image: const MetasImage.asset('assets/images/farmaco.jpg'))),
    Audio('assets/audio/Episodio3.mp3',
        metas: Metas(
            title: 'Episodio 3: El otro lado de la moneda',
            artist: 'Drugenius',
            image: const MetasImage.asset('assets/images/cora.jpg'))),
    Audio('assets/audio/Episodio4.mp3',
        metas: Metas(
            title:
                'Episodio 1: Asi de importante es la Farmacologia en la salud publica',
            artist: 'Drugenius',
            image: const MetasImage.asset('assets/images/medicina.jpg'))),
  ];

  @override
  void initState() {
    super.initState();
    setupPlaylist();
  }

  void setupPlaylist() async {
    await audioPlayer.open(Playlist(audios: audioList),
        autoStart: false, loopMode: LoopMode.playlist);
  }

  Widget swiper(RealtimePlayingInfos realtimePlayingInfos) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.45,
      child: Swiper(
        controller: swiperController,
        itemCount: audioList.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              audioList[index].metas.image!.path,
              fit: BoxFit.cover,
            ),
          );
        },
        onIndexChanged: (newIndex) {
          audioPlayer.playlistPlayAtIndex(newIndex);
        },
        viewportFraction: 0.75,
        scale: 0.8,
      ),
    );
  }

  Widget titleText(RealtimePlayingInfos realtimePlayingInfos) {
    final title =
        realtimePlayingInfos.current?.audio.audio.metas.title ?? 'Sin título';
    return Text(
      title,
      style: const TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget artistText(RealtimePlayingInfos realtimePlayingInfos) {
    final artist = realtimePlayingInfos.current?.audio.audio.metas.artist ??
        'Artista desconocido';
    return Text(
      artist,
      style: const TextStyle(
          fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget slider(RealtimePlayingInfos realtimePlayingInfos) {
    return SliderTheme(
        data: SliderThemeData(
            thumbColor: highlightColor,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 1),
            activeTickMarkColor: highlightColor,
            inactiveTickMarkColor: Colors.grey[800],
            overlayColor: Colors.transparent),
        child: Slider.adaptive(
            value: realtimePlayingInfos.currentPosition.inSeconds.toDouble(),
            min: 0,
            max: realtimePlayingInfos.duration.inSeconds.toDouble(),
            onChanged: (value) {
              audioPlayer.seek(Duration(seconds: value.toInt()));
            }));
  }

  Widget playBar(RealtimePlayingInfos realtimePlayingInfos) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            transformStrings(realtimePlayingInfos.currentPosition.inSeconds),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous_rounded),
                onPressed: () => swiperController.previous(),
                iconSize: screenHeight * 0.06,
                color: Colors.white,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              Container(
                decoration: BoxDecoration(
                    color: highlightColor, shape: BoxShape.circle),
                child: IconButton(
                  icon: Icon(realtimePlayingInfos.isPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded),
                  onPressed: () => audioPlayer.playOrPause(),
                  iconSize: screenHeight * 0.06,
                  color: Colors.white,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.skip_next_rounded),
                onPressed: () => swiperController.next(),
                iconSize: screenHeight * 0.06,
                color: Colors.white,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ],
          ),
          Text(
            transformStrings(realtimePlayingInfos.duration.inSeconds),
            style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
        ],
      ),
    );
  }

  //tranformacion
  String transformStrings(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString';
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
    swiperController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 10,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Reproductor",
              style: TextStyle(fontSize: 35, color: Colors.black),
            ),
          ],
        ),
        actions: const <Widget>[],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.push(context,
            //MaterialPageRoute(builder: (context) => VideoPlayerWidget2()));
          },
        ),
      ),
      backgroundColor: const Color(0xff16161e),
      body: audioPlayer.builderRealtimePlayingInfos(
          builder: (context, realtimePlayingInfos) {
        // ignore: unnecessary_null_comparison
        if (realtimePlayingInfos != null) {
          return Column(
            children: [
              SizedBox(height: screenHeight * 0.15),
              swiper(realtimePlayingInfos),
              SizedBox(height: screenHeight * 0.05),
              titleText(realtimePlayingInfos),
              SizedBox(height: screenHeight * 0.01),
              artistText(realtimePlayingInfos),
              SizedBox(height: screenHeight * 0.03),
              slider(realtimePlayingInfos),
              SizedBox(height: screenHeight * 0.03),
              playBar(realtimePlayingInfos),
            ],
          );
        } else {
          return const Column();
        }
      }),
    );
  }
}
