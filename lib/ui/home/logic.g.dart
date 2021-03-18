// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logic.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterStore on _CounterStore, Store {
  Computed<bool>? _$canLevelUpComputed;

  @override
  bool get canLevelUp =>
      (_$canLevelUpComputed ??= Computed<bool>(() => super.canLevelUp,
              name: '_CounterStore.canLevelUp'))
          .value;

  final _$nameAtom = Atom(name: '_CounterStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$levelAtom = Atom(name: '_CounterStore.level');

  @override
  int get level {
    _$levelAtom.reportRead();
    return super.level;
  }

  @override
  set level(int value) {
    _$levelAtom.reportWrite(value, super.level, () {
      super.level = value;
    });
  }

  final _$statsAtom = Atom(name: '_CounterStore.stats');

  @override
  ObservableMap<Stat, int> get stats {
    _$statsAtom.reportRead();
    return super.stats;
  }

  @override
  set stats(ObservableMap<Stat, int> value) {
    _$statsAtom.reportWrite(value, super.stats, () {
      super.stats = value;
    });
  }

  final _$updatedStatsAtom = Atom(name: '_CounterStore.updatedStats');

  @override
  ObservableMap<Stat, int> get updatedStats {
    _$updatedStatsAtom.reportRead();
    return super.updatedStats;
  }

  @override
  set updatedStats(ObservableMap<Stat, int> value) {
    _$updatedStatsAtom.reportWrite(value, super.updatedStats, () {
      super.updatedStats = value;
    });
  }

  final _$availablePointsAtom = Atom(name: '_CounterStore.availablePoints');

  @override
  int get availablePoints {
    _$availablePointsAtom.reportRead();
    return super.availablePoints;
  }

  @override
  set availablePoints(int value) {
    _$availablePointsAtom.reportWrite(value, super.availablePoints, () {
      super.availablePoints = value;
    });
  }

  final _$_CounterStoreActionController =
      ActionController(name: '_CounterStore');

  @override
  void levelUp() {
    final _$actionInfo = _$_CounterStoreActionController.startAction(
        name: '_CounterStore.levelUp');
    try {
      return super.levelUp();
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
level: ${level},
stats: ${stats},
updatedStats: ${updatedStats},
availablePoints: ${availablePoints},
canLevelUp: ${canLevelUp}
    ''';
  }
}
