import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'dashatar.dart';
import 'level.dart';

@visibleForTesting
class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

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
