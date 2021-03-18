import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../../main.dart';
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
              for (var stat in Stat.values)
                StatCounter(
                  label: names[stat]!,
                  type: stat,
                ),
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
class DashatarName extends StatelessWidget {
  const DashatarName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Observer(
      builder: (context) => Text(
        store.name,
        style: textTheme.headline3!.copyWith(color: FlutterColors.blue),
      ),
    );
  }
}

@visibleForTesting
class Level extends StatelessWidget {
  const Level({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Observer(
      builder: (context) => Text(
        'Level ${store.level}',
        style: textTheme.headline6,
      ),
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
    final textTheme = Theme.of(context).textTheme;
    return Observer(
      builder: (context) => Text(
        '${store.availablePoints} points remaining',
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
    return Observer(
      builder: (context) => OutlinedButton(
        onPressed: store.canLevelUp ? store.levelUp : null,
        child: const Text('Level up'),
      ),
    );
  }
}
