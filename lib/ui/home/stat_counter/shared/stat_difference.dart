import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../_internal/enums/stat_enum.dart';
import '../stat_counter_controller.dart';

class Difference extends StatelessWidget {
  const Difference({Key? key, required this.stat}) : super(key: key);

  final Stat stat;

  @override
  Widget build(BuildContext context) {
    final StatCounterController controller = Get.find(tag: stat.toString());
    final textTheme = Theme.of(context).textTheme;

    return Obx(() => Text(
          '+ ${controller.statDifference()}',
          style: textTheme.headline6!.copyWith(
            color: controller.getColor(),
          ),
        ));
  }
}
