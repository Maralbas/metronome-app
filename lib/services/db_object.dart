import 'package:hive/hive.dart';
import 'package:metronome/models/beat_bar.dart';
import 'package:metronome/models/tempo_type.dart';

class MetronomeDbObject {
  static get(String name) {
    Box box = Hive.box("tempo_types");
    return box.get(name);
  }

  static void addDefaults() {
    Box box = Hive.box("tempo_types");

    if (box.get("default") == null) {
      List<BeatBar> list = List();
      for (var i = 0; i < 4; i++) {
        list.add(BeatBar(BeatEnum.FULL.toString(), "beat.wav"));
      }

      TempoType tempoType = TempoType("default", 120, 4, list);

      box.put(tempoType.name, tempoType);
    }

    if (box.get("chachacha") == null) {
      List<BeatBar> list = List();
      for (var i = 0; i < 2; i++) {
        list.add(BeatBar(BeatEnum.FULL.toString(), "beat.wav"));
      }
      list.add(BeatBar(BeatEnum.FULL.toString(), "longer_beat.wav"));
      list.add(BeatBar(BeatEnum.HALF.toString(), "beat.wav"));
      list.add(BeatBar(BeatEnum.HALF.toString(), "beat.wav"));

      TempoType tempoType = TempoType("chachacha", 120, 4, list);

      box.put(tempoType.name, tempoType);
    }

    if (box.get("waltz") == null) {
      List<BeatBar> list = List();
      for (var i = 0; i < 3; i++) {
        list.add(BeatBar(BeatEnum.FULL.toString(), "beat.wav"));
      }

      TempoType tempoType = TempoType("waltz", 120, 4, list);

      box.put(tempoType.name, tempoType);
    }
  }
}
