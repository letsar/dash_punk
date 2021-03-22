import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../ui/home/widgets/stat_counter.dart';

part 'stat.freezed.dart';

@freezed
class Stat with _$Stat {
  factory Stat({
    @Default(1) int currentValue,
    @Default(0) int updatedValue,
  }) = _Stat;

  Stat._();

  late final int difference = updatedValue - currentValue;
  late final canDecrement = difference > minStat;
}
