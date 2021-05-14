import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/task.dart';
import '../works/works_route.dart';
import 'tasks_list.dart';

class TasksScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: Consumer(
          builder: (context, watch, _) => watch(tasksProvider).isNotEmpty
              ? TasksList()
              : Center(
                  child: Text('No tasks yet'),
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, WorksRoute.route),
        child: Icon(Icons.add),
      ),
    );
  }
}
