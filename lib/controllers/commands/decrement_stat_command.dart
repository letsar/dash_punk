import 'package:get/get.dart';

import '../../_internal/enums/stat_enum.dart';
import '../../ui/home/stat_counter/stat_counter_controller.dart';
import 'abstract_command.dart';

class DecrementStatCommand extends AbstractCommand {
  @override
  void execute(Stat stat) {
    // change available points (global)
    levelUpController.availablePoints.value++;

    // update current stat (local for the stat)
    final StatCounterController statCounterController =
        Get.find(tag: stat.toString());
    statCounterController.statValue.value--;

    levelUpController.canLevelUp.value =
        levelUpController.checkIfLevelUpPossible();
  }
}
