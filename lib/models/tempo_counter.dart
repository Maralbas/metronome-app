import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:metronome/models/beat_bar.dart';
import 'package:metronome/models/tempo_type.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:metronome/services/db_object.dart';

class TempoCounter {
  static final TempoCounter _singleton = TempoCounter._internal();
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  int bpm;
  bool isPlaying;
  TempoType tempoType;

  factory TempoCounter() {
    return _singleton;
  }

  TempoCounter._internal() {
    tempoType = MetronomeDbObject.get("default");
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    bpm = tempoType.defaultBpm;
    isPlaying = false;
  }

  change(String name) {
    tempoType = MetronomeDbObject.get(name);
    bpm = tempoType.defaultBpm;
  }

  start() {
    isPlaying = true;
    playTempos();
  }

  stop() {
    isPlaying = false;
  }

  changeTempoType(TempoType tempoType) {
    this.tempoType = tempoType;
  }

  changeSpeed(int speed) {
    this.bpm = speed;
  }

  playTempos() async {
    while (isPlaying) {
      for (BeatBar beatBar in tempoType.beatBars) {
        playLocal(beatBar);

        if (beatBar.beat == BeatEnum.FULL.toString()) {
          await Future.delayed(Duration(milliseconds: (60000 / bpm).round()));
        } else {
          await Future.delayed(
              Duration(milliseconds: (60000 / (bpm * 2)).round()));
        }

        audioPlayer.stop();
      }
    }

    await audioPlayer.stop();
  }

  playLocal(BeatBar beatBar) async {
    await audioPlayer.stop();

    if (isPlaying) {
      await audioCache.play(beatBar.soundUrl);
    }
  }
}
