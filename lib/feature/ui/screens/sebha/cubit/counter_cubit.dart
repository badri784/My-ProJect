import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
    : super(const CounterState(count: 0, totalCount: 0, selectedIndex: 0)) {
    loadCount();
  }

  late SharedPreferences preferences;

  Future<void> initPrefs() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> loadCount() async {
    await initPrefs();
    emit(
      state.copyWith(
        count: preferences.getInt('count') ?? 0,
        totalCount: preferences.getInt('totalCount') ?? 0,
      ),
    );
  }

  Future<void> incrementCounter() async {
    final newCount = state.count + 1;
    final newTotal = state.totalCount + 1;

    emit(state.copyWith(count: newCount, totalCount: newTotal));

    await saveCount();
  }

  Future<void> resetCount() async {
    emit(state.copyWith(count: 0));
    await saveCount();
  }

  Future<void> resetAll() async {
    emit(state.copyWith(count: 0, totalCount: 0));

    await saveCount();
  }

  Future<void> changeZikr(int index) async {
    emit(state.copyWith(selectedIndex: index, count: 0));

    await saveCount();
  }

  Future<void> saveCount() async {
    await preferences.setInt('count', state.count);
    await preferences.setInt('totalCount', state.totalCount);
  }
}
