import 'dart:math';

import 'package:flutter/material.dart';

export '../providers/worksListStateProvider.dart';

@immutable
class Work {
  final String name;
  final int durationSeconds;
  final bool isPicked;

  Work(int number)
      : name = 'Work# $number',
        durationSeconds = Random().nextInt(15) + 5,
        isPicked = false;

  Work._(
      {required this.durationSeconds,
      required this.isPicked,
      required this.name});

  Work copyWith({String? name, int? durationSeconds, bool? isPicked}) {
    return Work._(
        durationSeconds: durationSeconds ?? this.durationSeconds,
        isPicked: isPicked ?? this.isPicked,
        name: name ?? this.name);
  }

  Work togglePick() {
    return copyWith(isPicked: !this.isPicked);
  }
}
