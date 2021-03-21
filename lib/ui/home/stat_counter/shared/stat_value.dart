import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../_internal/enums/stat_enum.dart';
import '../../../../controllers/level_up_controller.dart';
import '../../../../theme/colors.dart';

@visibleForTesting
class StatValue extends StatelessWidget {
  const StatValue({Key? key, required this.stat}) : super(key: key);

  final Stat stat;

  @override
  Widget build(BuildContext context) {
    final LevelUpController controller = Get.find();

    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Text(
        '${controller.getInitialStatFromType(stat)}',
        style: textTheme.headline6!.copyWith(
          fontWeight: FontWeight.bold,
          color: FlutterColors.blue,
        ),
      ),
    );
  }
}
