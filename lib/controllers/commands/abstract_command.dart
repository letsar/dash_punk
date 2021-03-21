import 'package:get/get.dart';
import '../../_internal/enums/stat_enum.dart';
import '../level_up_controller.dart';

abstract class AbstractCommand {
  final LevelUpController levelUpController = Get.find();

  void execute(Stat stat);
}
