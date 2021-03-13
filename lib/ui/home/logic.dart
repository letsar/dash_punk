import 'package:binder/binder.dart';

enum Stat {
  strength,
  agility,
  wisdom,
  charisma,
}

final nameRef = StateRef('Dash Punk');
final levelRef = StateRef(1);
final unaffectedRef = StateRef(8);
final statsRef = StateRef<List<StateRef<int>>>([
  StateRef(1, name: 'str'),
  StateRef(1, name: 'agi'),
  StateRef(1, name: 'wis'),
  StateRef(1, name: 'cha'),
]);

final canLevelUpRef = Computed((watch) {
  return watch(unaffectedRef) == 0;
});

final levelUpLogicRef = LogicRef((scope) => LevelUpLogic(scope));

class LevelUpLogic with Logic {
  const LevelUpLogic(this.scope);

  @override
  final Scope scope;

  void levelUp() {
    final stats = read<List<StateRef<int>>>(statsRef);
    final strength = read<int>(stats[Stat.strength.index]);
    final agility = read<int>(stats[Stat.agility.index]);
    final wisdom = read<int>(stats[Stat.wisdom.index]);
    final charisma = read<int>(stats[Stat.charisma.index]);
    write(statsRef, <StateRef<int>>[
      StateRef(strength),
      StateRef(agility),
      StateRef(wisdom),
      StateRef(charisma),
    ]);
    write(levelRef, read(levelRef) + 1);
    write(unaffectedRef, 8);
  }
}
