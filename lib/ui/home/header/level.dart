import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/level_up_controller.dart';

@visibleForTesting
class Level extends StatelessWidget {
  const Level({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LevelUpController controller = Get.find();
    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Text(
        'Level ${controller.dashatarLevel.value}',
        style: textTheme.headline6,
      ),
    );
  }
}
