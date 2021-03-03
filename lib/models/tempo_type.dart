import 'package:hive/hive.dart';
import 'package:metronome/models/beat_bar.dart';

part 'tempo_type.g.dart';

@HiveType(typeId: 0)
class TempoType {
  @HiveField(0)
  String name;

  @HiveField(1)
  int defaultBpm;

  @HiveField(2)
  int numBars;

  @HiveField(3)
  List<BeatBar> beatBars;

  TempoType(this.name, this.defaultBpm, this.numBars, this.beatBars);
}
