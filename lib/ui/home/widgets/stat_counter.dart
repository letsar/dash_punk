import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../../../main.dart';
import '../../../theme/colors.dart';
import '../logic.dart';

const minStat = 0.0;
const maxStat = 4.0;

class StatCounter extends StatelessWidget {
  const StatCounter({
    Key? key,
    required this.label,
    required this.type,
  }) : super(key: key);

  final String label;
  final Stat type;

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
        children: [
          const Gap(16),
          const Expanded(child: StatName()),
          StatValue(type: type),
          const Gap(16),
          Difference(type: type),
          const Gap(32),
          Observer(
            builder: (context) {
              final enabled = store.updatedStats[type]! > minStat;
              return _StatButton(
                icon: Icons.remove,
                onPressed: enabled
                    ? () {
                        store.remove(type);
                      }
                    : null,
              );
            },
          ),
          Observer(
            builder: (context) {
              final enabled = store.updatedStats[type]! >= minStat && store.updatedStats[type]! < maxStat;
              return _StatButton(
                icon: Icons.add,
                onPressed: enabled
                    ? () {
                        store.add(type);
                      }
                    : null,
              );
            },
          ),
        ],
      ),
    );
  }
}

@visibleForTesting
class StatName extends StatelessWidget {
  const StatName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Observer(
      builder: (context) => Text(
        store.name,
        style: textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

@visibleForTesting
class StatValue extends StatelessWidget {
  final Stat type;

  const StatValue({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Observer(
      builder: (context) => Text(
        '${store.stats[type]}',
        style: textTheme.headline6!.copyWith(
          fontWeight: FontWeight.bold,
          color: FlutterColors.blue,
        ),
      ),
    );
  }
}

@visibleForTesting
class Difference extends StatelessWidget {
  final Stat type;

  const Difference({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Observer(
      builder: (context) {
        final value = store.updatedStats[type];
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
      },
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
