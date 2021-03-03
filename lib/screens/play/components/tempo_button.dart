import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metronome/cubit/metronome_cubit.dart';
import 'package:metronome/models/tempo_counter.dart';

class TempoButton extends StatelessWidget {
  int value;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.white,
      onPressed: () {
        BlocProvider.of<MetronomeCubit>(context).incrementSpeed(value);
      },
      child: Text(value.round().toString()),
    );
  }

  TempoButton(this.value);
}
