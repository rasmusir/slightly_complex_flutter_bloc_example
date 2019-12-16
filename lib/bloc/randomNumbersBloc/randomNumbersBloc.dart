import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/bloc/randomNumbersBloc/randomNumbersEvent.dart';
import 'package:bloc_example/bloc/randomNumbersBloc/randomNumbersState.dart';

class RandomNumbersBloc extends Bloc<RandomNumbersEvent, RandomNumbersState> {

  @override
  RandomNumbersState get initialState => RandomNumbersState.initial();

  @override
  Stream<RandomNumbersState> mapEventToState(RandomNumbersEvent event) async* {
    switch (event.runtimeType) {

      case NewRandomNumbersEvent:
        final random = Random();
        final newEvent = event as NewRandomNumbersEvent;
        yield RandomNumbersState(
          max: newEvent.max,
          numbers: List.generate(newEvent.count, (i) => random.nextInt(newEvent.max))
        );
      break;
      
      case MoreRandomNumbersEvent:
        final random = Random();
        final moreEvent = event as MoreRandomNumbersEvent;
        yield RandomNumbersState(
          max: state.max,
          numbers: state.numbers.followedBy(
            List.generate(moreEvent.count, (i) => random.nextInt(state.max))
          ).toList()
        );
      break;

    }
  }
}