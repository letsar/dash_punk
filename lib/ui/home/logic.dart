import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/logic/logic.dart';
import '../../models/stat/stat.dart';

const statList = <String>[
  'Strength',
  'Agility',
  'Wisdom',
  'Charisma',
];

final statIndexProvider = ScopedProvider<int>((ref) {
  throw UnimplementedError();
});

final statNameProvider = ScopedProvider<String>((ref) {
  throw UnimplementedError();
});

// providers
final nameProvider = Provider<String>((ref) => 'Dash Punk');

class LogicProvider extends StateNotifier<Logic> {
  LogicProvider(Logic state) : super(state);

  bool get canLevelUp => state.canLevelUp;

  void levelUp() {
    state = state.copyWith(
      unaffected: 8,
      level: state.level + 1,
      stats: state.stats
          .map((stat) => stat.copyWith(
                currentValue: stat.currentValue + stat.updatedValue,
                updatedValue: 0,
              ))
          .toList(),
    );
  }

  void incrementStat(int index) {
    final Stat stat = state.stats[index];
    final stats = state.stats;
    stats[index] = stat.copyWith(
      updatedValue: stat.updatedValue + 1,
    );

    state = state.copyWith(unaffected: state.unaffected - 1, stats: stats);
  }

  void decrementStat(int index) {
    final Stat stat = state.stats[index];
    final stats = state.stats;
    stats[index] = stat.copyWith(
      updatedValue: stat.updatedValue - 1,
    );

    state = state.copyWith(unaffected: state.unaffected + 1, stats: stats);
  }
}

final logicProvider = StateNotifierProvider<LogicProvider, Logic>(
  (ref) => LogicProvider(Logic(
    stats: [
      Stat(),
      Stat(),
      Stat(),
      Stat(),
    ],
  )),
  name: 'logicProvider',
);
