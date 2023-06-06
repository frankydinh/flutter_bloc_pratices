import 'package:bloc_pattern_sample/blocs/timer/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerText extends StatelessWidget {
  const TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minuteStr = ((duration / 60).floor().toString().padLeft(2, '0'));
    final secondStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minuteStr:$secondStr',
      style: const TextStyle(fontSize: 22),
    );
  }
}
