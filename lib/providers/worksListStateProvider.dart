import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/work.dart';

final worksListProvider =
    StateNotifierProvider<WorksListStateProvider, List<Work>>(
        (ref) => WorksListStateProvider());

final pickedWorksProvider = Provider<List<Work>>((ref) {
  return ref.watch(worksListProvider).where((work) => work.isPicked).toList();
});

final currentWorkProvider = ScopedProvider<Work>(null);

class WorksListStateProvider extends StateNotifier<List<Work>> {
  WorksListStateProvider([List<Work>? state]) : super(state ?? <Work>[]);

  void generateList() {
    state = List<Work>.generate(900, (i) => Work(i + 1));
  }

  void togglePick(Work work) {
    state = [
      for (final Work _work in state)
        _work.name == work.name ? work.togglePick() : _work,
    ];
  }

  void unpickAll() {
    state = [
      for (final Work work in state) work.isPicked ? work.togglePick() : work,
    ];
  }

  void delete() {
    state = [];
  }
}
