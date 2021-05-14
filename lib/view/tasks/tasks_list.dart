import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/task.dart';
import 'task_tile.dart';

class TasksList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final List<Task> tasks = watch(tasksProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: tasks.length,
        itemBuilder: (context, i) => ProviderScope(
            overrides: [currentTaskProvider.overrideWithValue(tasks[i])],
            child: const TaskTile()),
      ),
    );
  }
}
