import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  // CounterCubit(super.initialState);

  CounterCubit() : super(10);

  void increase() {
    emit(state + 1);
  }

  void decrease() {
    emit(state - 1);
  }
}
