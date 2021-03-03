import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metronome/cubit/metronome_cubit.dart';
import 'package:metronome/models/tempo_counter.dart';

class TempoSlider extends StatefulWidget {
  @override
  _TempoSliderState createState() => _TempoSliderState();
}

class _TempoSliderState extends State<TempoSlider> {
  @override
  Widget build(BuildContext context) {
    // var tempoValue = widget.tempoValueText;
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.red,
        inactiveTrackColor: Colors.black,
        trackHeight: 3.0,
        thumbColor: Colors.yellow,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
        overlayColor: Colors.purple.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
      ),
      child: BlocBuilder<MetronomeCubit, MetronomeState>(
        builder: (context, state) {
          return Slider(
              min: 10,
              max: 250,
              value: state.tempoCounter.bpm.toDouble(),
              //label: tempoValue.getValue().round().toString(),
              onChanged: (value) {
                if (TempoCounter().isPlaying) {
                  return null;
                } else {
                  BlocProvider.of<MetronomeCubit>(context)
                      .updateSpeed(value.toInt());
                }
              });
        },
      ),
    );
  }
}
