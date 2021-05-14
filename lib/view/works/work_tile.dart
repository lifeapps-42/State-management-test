import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/work.dart';
import '../../providers/worksListStateProvider.dart';

class WorkTile extends ConsumerWidget {
  const WorkTile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final Work work = watch(currentWorkProvider);
    print(work.name);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: work.isPicked ? BorderSide(width: 3) : BorderSide.none,
      ),
      child: InkWell(
        onTap: () => context.read(worksListProvider.notifier).togglePick(work),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                work.name,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                '${work.durationSeconds} sec.',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
