import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../_internal/enums/stat_enum.dart';
import '../../controllers/level_up_controller.dart';
import 'header/header.dart';
import 'stat_counter/stat_counter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LevelUpController>(
      init: LevelUpController(),
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  Gap(16),
                  Header(),
                  Gap(32),
                  RemainingPoints(),
                  Gap(16),
                  StatCounter(stat: Stat.strength),
                  StatCounter(stat: Stat.agility),
                  StatCounter(stat: Stat.wisdom),
                  StatCounter(stat: Stat.charisma),
                  LevelUpButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

@visibleForTesting
class RemainingPoints extends StatelessWidget {
  const RemainingPoints({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LevelUpController controller = Get.find();
    final textTheme = Theme.of(context).textTheme;

    return Obx(
      () => Text(
        '${controller.availablePoints.value} points remaining',
        style: textTheme.headline5,
      ),
    );
  }
}

@visibleForTesting
class LevelUpButton extends StatelessWidget {
  const LevelUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LevelUpController controller = Get.find();

    return Obx(
      () => OutlinedButton(
        onPressed: controller.canLevelUp.value ? controller.levelUp : null,
        child: const Text('Level up'),
      ),
    );
  }
}
