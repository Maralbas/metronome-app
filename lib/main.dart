import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:metronome/components/app_bar.dart';
import 'package:metronome/models/tempo_type.dart';
import 'package:metronome/models/beat_bar.dart';
import 'package:metronome/services/db_object.dart';
import 'package:metronome/theme/style.dart';
import 'package:metronome/screens/play/tempo.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(TempoTypeAdapter());
  Hive.registerAdapter(BeatBarAdapter());
  runApp(Metronome());
}

class Metronome extends StatefulWidget {
  @override
  _Metronome createState() => _Metronome();
}

class _Metronome extends State<Metronome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Metronome',
        theme: appTheme(),
        home: FutureBuilder(
          future: Hive.openBox("tempo_types"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                MetronomeDbObject.addDefaults();
                return Scaffold(
                    appBar: GeneralAppBar(
                      title: 'Tempo',
                    ),
                    body: MetronomeControl());
              }
            }
            // Although opening a Box takes a very short time,
            // we still need to return something before the Future completes.
            else
              return Scaffold();
          },
        ));
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
