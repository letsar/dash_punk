import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../theme/colors.dart';
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
              StatCounter(
                label: 'Strength',
              ),
              StatCounter(
                label: 'Agility',
              ),
              StatCounter(
                label: 'Wisdom',
              ),
              StatCounter(
                label: 'Charisma',
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
    final name = '<Name>';
    final textTheme = Theme.of(context).textTheme;
    return Text(
      name,
      style: textTheme.headline3!.copyWith(color: FlutterColors.blue),
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
    final level = 0;

    return Text(
      'Level $level',
      style: textTheme.headline6,
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
    final unaffected = 0;
    final textTheme = Theme.of(context).textTheme;
    return Text(
      '$unaffected points remaining',
      style: textTheme.headline5,
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
    final enabled = true;

    return OutlinedButton(
      onPressed: enabled ? () {} : null,
      child: const Text('Level up'),
    );
  }
}
