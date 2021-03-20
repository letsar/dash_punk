import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../stat/stat.dart';

part 'logic.freezed.dart';

@freezed
class Logic with _$Logic {
  factory Logic({
    required List<Stat> stats,
    @Default(8) int unaffected,
    @Default(1) int level,
  }) = _Logic;

  Logic._();

  late final canLevelUp = unaffected == 0;
}
