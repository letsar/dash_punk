import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../_internal/enums/stat_enum.dart';
import '../../../../controllers/commands/decrement_stat_command.dart';
import '../../../../controllers/commands/increment_stat_command.dart';
import '../../../../theme/colors.dart';
import '../stat_counter_controller.dart';

@visibleForTesting
class DecrementButton extends StatelessWidget {
  const DecrementButton({Key? key, required this.stat}) : super(key: key);

  final Stat stat;

  @override
  Widget build(BuildContext context) {
    final StatCounterController controller = Get.find(tag: stat.toString());

    return Obx(
      () => _StatButton(
        icon: Icons.remove,
        onPressed: controller.canBeDecremented()
            ? () => DecrementStatCommand().execute(stat)
            : null,
      ),
    );
  }
}

@visibleForTesting
class IncrementButton extends StatelessWidget {
  const IncrementButton({Key? key, required this.stat}) : super(key: key);

  final Stat stat;

  @override
  Widget build(BuildContext context) {
    final StatCounterController controller = Get.find(tag: stat.toString());

    return Obx(
      () => _StatButton(
        icon: Icons.add,
        onPressed: controller.canBeIncremented()
            ? () => IncrementStatCommand().execute(stat)
            : null,
      ),
    );
  }
}

class _StatButton extends StatelessWidget {
  const _StatButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
      ).copyWith(
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return FlutterColors.gray900;
          }
          return FlutterColors.white;
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return FlutterColors.gray100;
          }
          return FlutterColors.primary;
        }),
      ),
      child: Icon(icon),
    );
  }
}
