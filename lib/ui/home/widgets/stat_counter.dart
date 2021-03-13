import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../theme/colors.dart';
import '../logic.dart';

const minStat = 0.0;
const maxStat = 4.0;

final _statNameRef = StateRef('');

final _currentStatRef = StateRef<StateRef<int>>(null);

final _statLogicRef = LogicRef((scope) => _StatLogic(scope, StateRef(0)));

final _canBeIncrementedRef = Computed((watch) {
  final statDifference = watch(statDifferenceRef);
  final unaffected = watch(unaffectedRef);
  return statDifference < maxStat && unaffected > 0;
});

final _canBeDecrementedRef = Computed((watch) {
  final statDifference = watch(statDifferenceRef);
  return statDifference > minStat;
});

final statDifferenceRef = Computed((watch) {
  final statRef = watch(_currentStatRef);
  final stat = watch(statRef);
  return stat - statRef.initialState;
});

class _StatLogic with Logic {
  const _StatLogic(this.scope, this.statRef);

  @override
  final Scope scope;

  final StateRef<int> statRef;

  void increment() {
    write(statRef, read(statRef) + 1);
    write(unaffectedRef, read(unaffectedRef) - 1);
  }

  void decrement() {
    write(statRef, read(statRef) - 1);
    write(unaffectedRef, read(unaffectedRef) + 1);
  }
}

class StatCounter extends StatelessWidget {
  const StatCounter({
    Key? key,
    required this.label,
    required this.statRef,
  }) : super(key: key);

  final String label;
  final StateRef<int> statRef;

  @override
  Widget build(BuildContext context) {
    return BinderScope(
      overrides: [
        _statNameRef.overrideWith(label),
        _currentStatRef.overrideWith(statRef),
        _statLogicRef.overrideWith((scope) => _StatLogic(scope, statRef)),
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

class StatName extends StatelessWidget {
  const StatName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = context.watch(_statNameRef).toUpperCase();
    final textTheme = Theme.of(context).textTheme;
    return Text(
      name,
      style: textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

class StatValue extends StatelessWidget {
  const StatValue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stat = context.watch(_currentStatRef).initialState;
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

class Difference extends StatelessWidget {
  const Difference({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.watch(statDifferenceRef);
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

class DecrementButton extends StatelessWidget {
  const DecrementButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = context.watch(_canBeDecrementedRef);

    return _StatButton(
      icon: Icons.remove,
      onPressed: enabled ? () => context.use(_statLogicRef).decrement() : null,
    );
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = context.watch(_canBeIncrementedRef);

    return _StatButton(
      icon: Icons.add,
      onPressed: enabled ? () => context.use(_statLogicRef).increment() : null,
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
