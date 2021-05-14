import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/task.dart';

class TaskTile extends ConsumerWidget {
  const TaskTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final Task task = watch(currentTaskProvider);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: task.done ? Colors.green[300] : null,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                '${task.works.length} work(s) in task',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: task.done
                      ? Text('task done')
                      : Text('left sec.: ${task.secondsLeft}'),
                ),
                task.done
                    ? Icon(Icons.done)
                    : Container(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          value: task.elepsedDouble,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
