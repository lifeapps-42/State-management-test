import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task.dart';
import '../models/work.dart';

final tasksProvider =
    StateNotifierProvider<TasksStateProvider, List<Task>>((ref) {
  return TasksStateProvider(ref.read);
});

final currentTaskProvider = ScopedProvider<Task>(null);

final incrementer = StateProvider<int>((ref) => 1);

class TasksStateProvider extends StateNotifier<List<Task>> {
  TasksStateProvider(this.read) : super(<Task>[]);

  final Reader read;

  void create(List<Work> works) {
    final _incrementer = read(incrementer);
    final Task newTask = Task(_incrementer.state, works);
    _incrementer.state = _incrementer.state + 1;

    state = state..add(newTask);

    Timer.periodic(Duration(seconds: 1), (timer) {
      print('tick');
      state = [
        for (final Task taskFromList in state)
          taskFromList.id == newTask.id
              ? taskFromList.tick(timer)
              : taskFromList
      ];
    });
  }
}
