import 'package:flutter/material.dart';
import 'package:metronome/models/tempo_counter.dart';

class StartStopButtonControl extends StatefulWidget {
  StartStopButton createState() => StartStopButton();
}

class StartStopButton extends State<StartStopButtonControl> {
  TempoCounter tempoCounter = TempoCounter();
  StartStopButtonIcon icon = StartStopButtonIcon(Icons.play_arrow);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          if (tempoCounter.isPlaying) {
            tempoCounter.stop();
            setState(() {
              icon = StartStopButtonIcon(Icons.play_arrow);
            });
          } else {
            tempoCounter.start();
            setState(() {
              icon = StartStopButtonIcon(Icons.stop);
            });
          }
        },
        child: icon,
      ),
    );
  }
}

class StartStopButtonIcon extends StatelessWidget {
  IconData iconData = Icons.play_arrow;

  StartStopButtonIcon(this.iconData);

  @override
  Widget build(BuildContext context) {
    return Icon(iconData, color: Colors.black);
  }
}
