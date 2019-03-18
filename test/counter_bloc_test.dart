import 'package:flutter_counter/blocs/counter_bloc.dart';
import 'package:flutter_counter/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Bloc Test', () {
    CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    test('Initial State is 0', () {
      expect(counterBloc.initialState, 0);
    });

    test('Increment updates state to 1', () {
      final List<int> expectedState = [0, 1];

      expectLater(counterBloc.state, emitsInOrder(expectedState));

      counterBloc.dispatch(CounterEvent.increment);
    });


    test('Decrement updates state to -1', () {
      final List<int> expectedState = [0, -1];

      expectLater(counterBloc.state, emitsInOrder(expectedState));

      counterBloc.dispatch(CounterEvent.decrement);
    });
  });
}
