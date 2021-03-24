import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme/colors.dart';
import '../logic.dart';

const minStat = 0.0;
const maxStat = 4.0;

class StatCounter extends StatelessWidget {
  const StatCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        children: const [
          Gap(16),
          Expanded(child: StatName()),
          StatValue(),
          Gap(16),
          Difference(),
          Gap(32),
          DecrementButton(),
          IncrementButton(),
        ],
      ),
    );
  }
}

@visibleForTesting
class StatName extends HookWidget {
  const StatName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = useProvider(statNameProvider);
    final textTheme = Theme.of(context).textTheme;
    return Text(
      name,
      style: textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

@visibleForTesting
class StatValue extends HookWidget {
  const StatValue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = useProvider(statIndexProvider);
    final stat = useProvider(logicProvider.state).stats[index].currentValue;
    final textTheme = Theme.of(context).textTheme;

    return Text(
      '$stat',
      style: textTheme.headline6!.copyWith(
        fontWeight: FontWeight.bold,
        color: FlutterColors.blue,
      ),
    );
  }
}

@visibleForTesting
class Difference extends HookWidget {
  const Difference({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = useProvider(statIndexProvider);
    final value = useProvider(logicProvider.state).stats[index].updatedValue;
    final textTheme = Theme.of(context).textTheme;

    Color color = FlutterColors.secondary;
    if (value == 0) {
      color = FlutterColors.gray600;
    } else if (value == maxStat) {
      color = FlutterColors.primary;
    }

    return Text(
      '+ $value',
      style: textTheme.headline6!.copyWith(
        color: color,
      ),
    );
  }
}

@visibleForTesting
class DecrementButton extends HookWidget {
  const DecrementButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = useProvider(statIndexProvider);
    final enabled = useProvider(logicProvider.state).stats[index].canDecrement;

    return _StatButton(
      icon: Icons.remove,
      onPressed: enabled
          ? () => context.read(logicProvider).decrementStat(index)
          : null,
    );
  }
}

@visibleForTesting
class IncrementButton extends HookWidget {
  const IncrementButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = useProvider(statIndexProvider);
    final logic = useProvider(logicProvider.state);
    final stat = logic.stats[index];
    final enabled = stat.updatedValue < maxStat && logic.unaffected > 0;

    return _StatButton(
      icon: Icons.add,
      onPressed: enabled
          ? () => context.read(logicProvider).incrementStat(index)
          : null,
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
