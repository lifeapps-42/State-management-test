import 'dart:async';

import 'package:flutter/material.dart';

import 'work.dart';

export '../providers/tasks_provider.dart';

@immutable
class Task {
  final int id;
  final List<Work> works;
  final bool done;
  final int totalSeconds;
  final int secondsLeft;

  Task(
    this.id,
    this.works,
  )   : done = false,
        totalSeconds = works.fold<int>(
            0, (previousValue, work) => previousValue + work.durationSeconds),
        secondsLeft = works.fold<int>(
            0, (previousValue, work) => previousValue + work.durationSeconds);

  Task._(
      {required this.works,
      required this.done,
      required this.totalSeconds,
      required this.secondsLeft,
      required this.id});

  Task copyWith(
      {List<Work>? works,
      int? totalSeconds,
      bool? done,
      int? secondsLeft,
      int? id}) {
    return Task._(
        works: works ?? this.works,
        done: done ?? this.done,
        totalSeconds: totalSeconds ?? this.totalSeconds,
        secondsLeft: secondsLeft ?? this.secondsLeft,
        id: id ?? this.id);
  }

  Task _toDone() => copyWith(done: true);

  Task tick(Timer ticker) {
    if (secondsLeft != 1) {
      print(secondsLeft);
      return copyWith(secondsLeft: secondsLeft - 1);
    } else {
      print('done');
      ticker.cancel();
      return _toDone();
    }
  }

  double get elepsedDouble => secondsLeft / totalSeconds;
}
