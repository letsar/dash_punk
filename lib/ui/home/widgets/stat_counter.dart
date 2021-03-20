import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme/colors.dart';
import '../logic.dart';

const minStat = 0.0;
const maxStat = 4.0;

final _statIndexProvider = ScopedProvider<int>((ref) {
  throw UnimplementedError();
});

class StatCounter extends StatelessWidget {
  const StatCounter({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);

  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        _statIndexProvider.overrideWithValue(index),
      ],
      child: Container(
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
      ),
    );
  }
}

@visibleForTesting
class StatName extends HookWidget {
  const StatName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = useProvider(_statIndexProvider);
    final textTheme = Theme.of(context).textTheme;
    return Text(
      statList[index],
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
    final index = useProvider(_statIndexProvider);
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
    final index = useProvider(_statIndexProvider);
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
    final index = useProvider(_statIndexProvider);
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
    final index = useProvider(_statIndexProvider);
    final logic = useProvider(logicProvider.state);
    final stat = logic.stats[index];
    final enabled = stat.difference < maxStat && logic.unaffected > 0;

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
