import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:metronome/cubit/metronome_cubit.dart';
import 'package:metronome/models/tempo_counter.dart';
import 'package:metronome/models/tempo_type.dart';
import 'package:metronome/screens/play/components/start_stop_button.dart';
import 'package:metronome/screens/play/components/tempo_button.dart';

import 'components/tempo_slider.dart';

class MetronomeControl extends StatefulWidget {
  MetronomeControlState createState() => MetronomeControlState();
}

class MetronomeControlState extends State<MetronomeControl> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MetronomeCubit(),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Column(children: [
                TempoButton(-10),
                TempoButton(-5),
              ]),
              BlocBuilder<MetronomeCubit, MetronomeState>(
                  builder: (context, state) {
                return Text(
                  state.tempoCounter.bpm.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                );
              }),
              Column(children: [
                TempoButton(10),
                TempoButton(5),
              ]),
            ]),
            TempoSlider(),
            StartStopButtonControl(),
            WatchBoxBuilder(
              box: Hive.box("tempo_types"),
              builder: (context, box) {
                return DropdownButton<String>(
                    value: TempoCounter().tempoType.name,
                    style: TextStyle(color: Colors.white),
                    items: box.values.map((tempoType) {
                      tempoType as TempoType;
                      return new DropdownMenuItem<String>(
                        value: tempoType.name,
                        child: new Text(tempoType.name),
                      );
                    }).toList(),
                    onChanged: (String name) {
                      setState(() {
                        TempoCounter().change(name);
                      });
                    });
              },
            )
          ],
        ));
  }
}
