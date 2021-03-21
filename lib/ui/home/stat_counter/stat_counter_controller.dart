import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../_internal/enums/stat_enum.dart';
import '../../../controllers/level_up_controller.dart';
import '../../../theme/colors.dart';

class StatCounterController extends GetxController {
  StatCounterController({required this.statType, required this.statValue});

  static const _minStat = 0;
  static const _maxStat = 4;

  final RxInt statValue;
  final Stat statType;

  bool canBeDecremented() => statDifference() > _minStat;

  bool canBeIncremented() {
    final LevelUpController levelUpController = Get.find();
    return statDifference() < _maxStat &&
        levelUpController.availablePoints.value > 0;
  }

  int statDifference() {
    final LevelUpController levelUpController = Get.find();
    final initialStat =
        levelUpController.getInitialStatFromType(statType).value;
    return statValue.value - initialStat;
  }

  Color getColor() {
    final value = statDifference();
    Color color = FlutterColors.secondary;
    if (value == 0) {
      color = FlutterColors.gray600;
    } else if (value == _maxStat) {
      color = FlutterColors.primary;
    }
    return color;
  }
}
