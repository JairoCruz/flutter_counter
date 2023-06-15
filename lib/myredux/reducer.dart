import 'actions_redux.dart';

int counterReducer(int state, dynamic action) {
  switch (action) {
    case ActionCounter.increment:
      return state + 1;
    case ActionCounter.decrement:
      return state - 1;
    case ActionCounter.reset:
      return state = 0;
   default:
    return state;
  }
}