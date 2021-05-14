import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/work.dart';
import 'work_tile.dart';

class WorksList extends ConsumerWidget {
  const WorksList();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final List<Work> works = watch(worksListProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
        itemCount: works.length,
        itemBuilder: (context, i) => ProviderScope(
            overrides: [currentWorkProvider.overrideWithValue(works[i])],
            child: const WorkTile()),
      ),
    );
  }
}
