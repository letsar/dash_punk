import 'package:mobx/mobx.dart';

part 'logic.g.dart';

final names = {
  Stat.strength: 'Strength',
  Stat.agility: 'Agility',
  Stat.charisma: 'Charisma',
  Stat.wisdom: 'Wisdom',
};

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {
  @observable
  String name = 'Dash Punk';

  @observable
  int level = 1;

  @observable
  ObservableMap<Stat, int> stats = ObservableMap.of({
    Stat.strength: 1,
    Stat.agility: 1,
    Stat.charisma: 1,
    Stat.wisdom: 1,
  });

  @observable
  ObservableMap<Stat, int> updatedStats = ObservableMap.of({
    Stat.strength: 0,
    Stat.agility: 0,
    Stat.charisma: 0,
    Stat.wisdom: 0,
  });

  @observable
  int availablePoints = 8;

  @computed
  bool get canLevelUp => availablePoints == 0;

  void _resetStats() {
    updatedStats[Stat.strength] = 0;
    updatedStats[Stat.agility] = 0;
    updatedStats[Stat.charisma] = 0;
    updatedStats[Stat.wisdom] = 0;
  }

  @action
  void add(Stat type) {
    updatedStats[type] = updatedStats[type]! + 1;
    availablePoints--;
  }

  @action
  void remove(Stat type) {
    updatedStats[type] = updatedStats[type]! - 1;
    availablePoints++;
  }

  @action
  void levelUp() {
    stats[Stat.strength] = stats[Stat.strength]! + updatedStats[Stat.strength]!;
    stats[Stat.agility] = stats[Stat.agility]! + updatedStats[Stat.agility]!;
    stats[Stat.charisma] = stats[Stat.charisma]! + updatedStats[Stat.charisma]!;
    stats[Stat.wisdom] = stats[Stat.wisdom]! + updatedStats[Stat.wisdom]!;
    _resetStats();
    level = level + 1;
    availablePoints = 8;
  }
}

enum Stat {
  strength,
  agility,
  wisdom,
  charisma,
}
