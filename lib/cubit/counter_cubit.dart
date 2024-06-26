import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    if (state < 10) emit(state + 1);
  }

  void decrement() {
    if (state > -10) emit(state - 1);
  }

  void reset() => emit(0);
}
