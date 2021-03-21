import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../_internal/enums/stat_enum.dart';
import '../../../theme/colors.dart';

import 'shared/shared.dart';
import 'stat_counter_controller.dart';

class StatCounter extends StatelessWidget {
  const StatCounter({Key? key, required this.stat}) : super(key: key);

  final Stat stat;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatCounterController>(
      // todo: replace with answer from levelUpController...
      init: StatCounterController(statType: stat, statValue: 1.obs),
      initState: (_) {},
      tag: stat.toString(),
      builder: (_) {
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: ShapeDecoration(
            color: FlutterColors.secondary.withOpacity(0.1),
            shape: const StadiumBorder(
              side: BorderSide(
                color: FlutterColors.secondary,
                width: 2,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Gap(16),
              Expanded(child: StatName(stat: stat)),
              StatValue(stat: stat),
              const Gap(16),
              Difference(stat: stat),
              const Gap(32),
              DecrementButton(stat: stat),
              IncrementButton(stat: stat),
            ],
          ),
        );
      },
    );
  }
}
