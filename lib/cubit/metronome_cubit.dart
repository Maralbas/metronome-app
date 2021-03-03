import 'package:bloc/bloc.dart';
import 'package:metronome/models/tempo_counter.dart';

part 'metronome_state.dart';

class MetronomeCubit extends Cubit<MetronomeState> {
  MetronomeCubit() : super(MetronomeState());

  void incrementSpeed(int speed) {
    int actualSpeed = state.tempoCounter.bpm;
    if (actualSpeed + speed < 10) {
      updateSpeed(10);
    } else if (actualSpeed + speed > 250) {
      updateSpeed(250);
    } else {
      updateSpeed(actualSpeed + speed);
    }
  }

  void updateSpeed(int speed) {
    state.tempoCounter.changeSpeed(speed);
    emit(MetronomeState());
  }
}
