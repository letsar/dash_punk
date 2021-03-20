import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../theme/colors.dart';
import 'logic.dart';
import 'widgets/stat_counter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(16),
              const Header(),
              const Gap(32),
              const RemainingPoints(),
              const Gap(16),
              ...statList.asMap().entries.map((entry) {
                return StatCounter(label: entry.value, index: entry.key);
              }),
              const LevelUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

@visibleForTesting
class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Flexible(
          child: Dashatar(),
        ),
        const Gap(8),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              DashatarName(),
              Level(),
            ],
          ),
        )
      ],
    );
  }
}

@visibleForTesting
class Dashatar extends StatelessWidget {
  const Dashatar({
    Key? key,
  }) : super(key: key);

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
class DashatarName extends HookWidget {
  const DashatarName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = useProvider(nameProvider);
    final textTheme = Theme.of(context).textTheme;
    return Text(
      name,
      style: textTheme.headline3!.copyWith(color: FlutterColors.blue),
    );
  }
}

@visibleForTesting
class Level extends HookWidget {
  const Level({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final level = useProvider(logicProvider.state).level;

    return Text(
      'Level $level',
      style: textTheme.headline6,
    );
  }
}

@visibleForTesting
class RemainingPoints extends HookWidget {
  const RemainingPoints({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final unaffected = useProvider(logicProvider.state).unaffected;
    final textTheme = Theme.of(context).textTheme;
    return Text(
      '$unaffected points remaining',
      style: textTheme.headline5,
    );
  }
}

@visibleForTesting
class LevelUpButton extends HookWidget {
  const LevelUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = useProvider(logicProvider.state).canLevelUp;

    return OutlinedButton(
      onPressed: enabled ? () => context.read(logicProvider).levelUp() : null,
      child: const Text('Level up'),
    );
  }
}
