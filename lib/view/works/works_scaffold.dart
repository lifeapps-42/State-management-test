import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/task.dart';
import '../../models/work.dart';
import '../../providers/worksListStateProvider.dart';
import 'works_list.dart';

class WorksScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitleConsumer(),
        actions: [
          UnpickAllButton(),
          DeleteButton(),
        ],
      ),
      body: Consumer(
          builder: (context, watch, _) => watch(worksListProvider).isNotEmpty
              ? const WorksList()
              : const NoWorksBody()),
      floatingActionButton: Consumer(
        builder: (context, watch, _) => watch(pickedWorksProvider).isNotEmpty
            ? FloatingActionButton(
                child: Icon(Icons.done),
                onPressed: () {
                  context
                      .read(tasksProvider.notifier)
                      .create(context.read(pickedWorksProvider));
                  context.read(worksListProvider.notifier).unpickAll();
                  Navigator.pop(context);
                },
              )
            : Container(
                height: 0,
                width: 0,
              ),
      ),
    );
  }
}

class AppBarTitleConsumer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final List<Work> pickedWorks = watch(pickedWorksProvider);

    if (pickedWorks.isEmpty) {
      return Text('Works');
    } else {
      final int totalSeconds = pickedWorks.fold(
          0, (previousValue, work) => previousValue + work.durationSeconds);
      return Text('${pickedWorks.length} works on $totalSeconds sec. total');
    }
  }
}

class DeleteButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    if (watch(worksListProvider).isNotEmpty) {
      return IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: () => context.read(worksListProvider.notifier).delete());
    } else {
      return Container();
    }
  }
}

class UnpickAllButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    if (watch(pickedWorksProvider).isNotEmpty) {
      return IconButton(
          icon: Icon(Icons.clear),
          onPressed: () =>
              context.read(worksListProvider.notifier).unpickAll());
    } else {
      return Container();
    }
  }
}

class NoWorksBody extends StatelessWidget {
  const NoWorksBody();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Generate'),
        onPressed: () =>
            context.read(worksListProvider.notifier).generateList(),
      ),
    );
  }
}
