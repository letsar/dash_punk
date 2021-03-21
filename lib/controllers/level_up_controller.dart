import 'package:get/get.dart';
import '../_internal/enums/stat_enum.dart';
import '../ui/home/stat_counter/stat_counter_controller.dart';

class LevelUpController extends GetxController {
  // if you want the value to be a stream, add '.obs' to the end
  final dashatarName = 'DashPunk'.obs;
  final dashatarLevel = 1.obs;
  final availablePoints = 8.obs;
  final canLevelUp = false.obs;

  // the 'saved' stats, updated only on level up
  final Map<Stat, RxInt> statsRef = {
    Stat.strength: 1.obs,
    Stat.agility: 1.obs,
    Stat.wisdom: 1.obs,
    Stat.charisma: 1.obs,
  };

  RxInt getInitialStatFromType(Stat statType) => statsRef[statType] ?? 1.obs;

  bool checkIfLevelUpPossible() => availablePoints.value == 0;

  void levelUp() {
    // iterate through each 'saved' stat, then update with the newest value
    statsRef.forEach(
      (key, savedStat) => savedStat.value = _getCurrentStatValue(key),
    );

    availablePoints.value = 8;
    dashatarLevel.value++;
  }

  // find active value from the controller for a specific stat
  int _getCurrentStatValue(Stat stat) =>
      Get.find<StatCounterController>(tag: stat.toString()).statValue.value ??
      1;
}
