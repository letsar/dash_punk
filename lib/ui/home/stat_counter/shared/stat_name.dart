import 'package:flutter/material.dart';
import '../../../../_internal/enums/stat_enum.dart';
import '../../../../_internal/utils/stat_util.dart';

class StatName extends StatelessWidget {
  const StatName({Key? key, required this.stat}) : super(key: key);

  final Stat stat;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      StatUtil().getLabelFromStatType(stat),
      style: textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
