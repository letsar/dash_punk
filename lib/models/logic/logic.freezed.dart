// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'logic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LogicTearOff {
  const _$LogicTearOff();

  _Logic call({required List<Stat> stats, int unaffected = 8, int level = 1}) {
    return _Logic(
      stats: stats,
      unaffected: unaffected,
      level: level,
    );
  }
}

/// @nodoc
const $Logic = _$LogicTearOff();

/// @nodoc
mixin _$Logic {
  List<Stat> get stats => throw _privateConstructorUsedError;
  int get unaffected => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogicCopyWith<Logic> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogicCopyWith<$Res> {
  factory $LogicCopyWith(Logic value, $Res Function(Logic) then) =
      _$LogicCopyWithImpl<$Res>;
  $Res call({List<Stat> stats, int unaffected, int level});
}

/// @nodoc
class _$LogicCopyWithImpl<$Res> implements $LogicCopyWith<$Res> {
  _$LogicCopyWithImpl(this._value, this._then);

  final Logic _value;
  // ignore: unused_field
  final $Res Function(Logic) _then;

  @override
  $Res call({
    Object? stats = freezed,
    Object? unaffected = freezed,
    Object? level = freezed,
  }) {
    return _then(_value.copyWith(
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<Stat>,
      unaffected: unaffected == freezed
          ? _value.unaffected
          : unaffected // ignore: cast_nullable_to_non_nullable
              as int,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$LogicCopyWith<$Res> implements $LogicCopyWith<$Res> {
  factory _$LogicCopyWith(_Logic value, $Res Function(_Logic) then) =
      __$LogicCopyWithImpl<$Res>;
  @override
  $Res call({List<Stat> stats, int unaffected, int level});
}

/// @nodoc
class __$LogicCopyWithImpl<$Res> extends _$LogicCopyWithImpl<$Res>
    implements _$LogicCopyWith<$Res> {
  __$LogicCopyWithImpl(_Logic _value, $Res Function(_Logic) _then)
      : super(_value, (v) => _then(v as _Logic));

  @override
  _Logic get _value => super._value as _Logic;

  @override
  $Res call({
    Object? stats = freezed,
    Object? unaffected = freezed,
    Object? level = freezed,
  }) {
    return _then(_Logic(
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<Stat>,
      unaffected: unaffected == freezed
          ? _value.unaffected
          : unaffected // ignore: cast_nullable_to_non_nullable
              as int,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
class _$_Logic extends _Logic with DiagnosticableTreeMixin {
  _$_Logic({required this.stats, this.unaffected = 8, this.level = 1})
      : super._();

  @override
  final List<Stat> stats;
  @JsonKey(defaultValue: 8)
  @override
  final int unaffected;
  @JsonKey(defaultValue: 1)
  @override
  final int level;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Logic(stats: $stats, unaffected: $unaffected, level: $level)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Logic'))
      ..add(DiagnosticsProperty('stats', stats))
      ..add(DiagnosticsProperty('unaffected', unaffected))
      ..add(DiagnosticsProperty('level', level));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Logic &&
            (identical(other.stats, stats) ||
                const DeepCollectionEquality().equals(other.stats, stats)) &&
            (identical(other.unaffected, unaffected) ||
                const DeepCollectionEquality()
                    .equals(other.unaffected, unaffected)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stats) ^
      const DeepCollectionEquality().hash(unaffected) ^
      const DeepCollectionEquality().hash(level);

  @JsonKey(ignore: true)
  @override
  _$LogicCopyWith<_Logic> get copyWith =>
      __$LogicCopyWithImpl<_Logic>(this, _$identity);
}

abstract class _Logic extends Logic {
  factory _Logic({required List<Stat> stats, int unaffected, int level}) =
      _$_Logic;
  _Logic._() : super._();

  @override
  List<Stat> get stats => throw _privateConstructorUsedError;
  @override
  int get unaffected => throw _privateConstructorUsedError;
  @override
  int get level => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LogicCopyWith<_Logic> get copyWith => throw _privateConstructorUsedError;
}
