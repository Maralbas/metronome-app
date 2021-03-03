import 'package:enum_to_string/enum_to_string.dart';
import 'package:hive/hive.dart';

part 'beat_bar.g.dart';

enum BeatEnum { FULL, HALF }

@HiveType(typeId: 1)
class BeatBar {
  @HiveField(0)
  String beat;

  @HiveField(1)
  String soundUrl;

  BeatBar(this.beat, this.soundUrl);
}
