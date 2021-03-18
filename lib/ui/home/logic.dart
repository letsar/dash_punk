import 'package:binder/binder.dart';

final nameRef = StateRef('Dash Punk');
final levelRef = StateRef(1);
final unaffectedRef = StateRef(8);
final canLevelUpRef = Computed((watch) {
  return watch(unaffectedRef) == 0;
});

enum Stat {
  strength,
  agility,
  wisdom,
  charisma,
}

final statsRef = StateRef<List<StateRef<int>>>([
  StateRef(1),
  StateRef(1),
  StateRef(1),
  StateRef(1),
]);

final levelUpLogicRef = LogicRef((scope) => LevelUpLogic(scope));

class LevelUpLogic with Logic {
  const LevelUpLogic(this.scope);

  @override
  final Scope scope;

  void levelUp() {
    final stats = read(statsRef);
    final strength = read(stats[Stat.strength.index]);
    final agility = read(stats[Stat.agility.index]);
    final wisdom = read(stats[Stat.wisdom.index]);
    final charisma = read(stats[Stat.charisma.index]);
    write(statsRef, [
      StateRef(strength),
      StateRef(agility),
      StateRef(wisdom),
      StateRef(charisma),
    ]);
    write(unaffectedRef, 8);
    write(levelRef, read(levelRef) + 1);
  }
}
