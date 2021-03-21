import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/level_up_controller.dart';
import '../../../theme/colors.dart';

@visibleForTesting
class Dashatar extends StatelessWidget {
  const Dashatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(
              color: FlutterColors.secondary,
              width: 4,
            ),
          ),
          position: DecorationPosition.foreground,
          child: Image.asset(
            'assets/dashatar.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

@visibleForTesting
class DashatarName extends StatelessWidget {
  const DashatarName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LevelUpController controller = Get.find();
    final textTheme = Theme.of(context).textTheme;
    return Obx(
      () => Text(
        controller.dashatarName.value,
        style: textTheme.headline3!.copyWith(color: FlutterColors.blue),
      ),
    );
  }
}
