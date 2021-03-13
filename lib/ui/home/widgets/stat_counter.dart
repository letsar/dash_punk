import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../theme/colors.dart';

const minStat = 0.0;
const maxStat = 4.0;

class StatCounter extends StatelessWidget {
  const StatCounter({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

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
class StatName extends StatelessWidget {
  const StatName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = '<STAT NAME>';
    final textTheme = Theme.of(context).textTheme;
    return Text(
      name,
      style: textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

@visibleForTesting
class StatValue extends StatelessWidget {
  const StatValue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stat = 0;
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
class Difference extends StatelessWidget {
  const Difference({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = 0;
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
class DecrementButton extends StatelessWidget {
  const DecrementButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = true;

    return _StatButton(
      icon: Icons.remove,
      onPressed: enabled ? () {} : null,
    );
  }
}

@visibleForTesting
class IncrementButton extends StatelessWidget {
  const IncrementButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = true;

    return _StatButton(
      icon: Icons.add,
      onPressed: enabled ? () {} : null,
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
