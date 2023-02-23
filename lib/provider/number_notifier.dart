import 'package:flutter_riverpod/flutter_riverpod.dart';

final numbersProvider = StateNotifierProvider<NumberNotifier, List<String>>(
  (ref) {
    return NumberNotifier();
  },
);

class NumberNotifier extends StateNotifier<List<String>> {
  NumberNotifier() : super(['1', '2']);

  add(String num) {
    print('add was called $num');
    var newState = [...state, num];
    state = newState;
    print(state);
  }

  void remove(String num) {
    state = [...state.where((element) => element != num)];
  }
}
