// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StatTearOff {
  const _$StatTearOff();

  _Stat call({int currentValue = 0, int updatedValue = 0}) {
    return _Stat(
      currentValue: currentValue,
      updatedValue: updatedValue,
    );
  }
}

/// @nodoc
const $Stat = _$StatTearOff();

/// @nodoc
mixin _$Stat {
  int get currentValue => throw _privateConstructorUsedError;
  int get updatedValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatCopyWith<Stat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatCopyWith<$Res> {
  factory $StatCopyWith(Stat value, $Res Function(Stat) then) =
      _$StatCopyWithImpl<$Res>;
  $Res call({int currentValue, int updatedValue});
}

/// @nodoc
class _$StatCopyWithImpl<$Res> implements $StatCopyWith<$Res> {
  _$StatCopyWithImpl(this._value, this._then);

  final Stat _value;
  // ignore: unused_field
  final $Res Function(Stat) _then;

  @override
  $Res call({
    Object? currentValue = freezed,
    Object? updatedValue = freezed,
  }) {
    return _then(_value.copyWith(
      currentValue: currentValue == freezed
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as int,
      updatedValue: updatedValue == freezed
          ? _value.updatedValue
          : updatedValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$StatCopyWith<$Res> implements $StatCopyWith<$Res> {
  factory _$StatCopyWith(_Stat value, $Res Function(_Stat) then) =
      __$StatCopyWithImpl<$Res>;
  @override
  $Res call({int currentValue, int updatedValue});
}

/// @nodoc
class __$StatCopyWithImpl<$Res> extends _$StatCopyWithImpl<$Res>
    implements _$StatCopyWith<$Res> {
  __$StatCopyWithImpl(_Stat _value, $Res Function(_Stat) _then)
      : super(_value, (v) => _then(v as _Stat));

  @override
  _Stat get _value => super._value as _Stat;

  @override
  $Res call({
    Object? currentValue = freezed,
    Object? updatedValue = freezed,
  }) {
    return _then(_Stat(
      currentValue: currentValue == freezed
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as int,
      updatedValue: updatedValue == freezed
          ? _value.updatedValue
          : updatedValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
class _$_Stat extends _Stat with DiagnosticableTreeMixin {
  _$_Stat({this.currentValue = 0, this.updatedValue = 0}) : super._();

  @JsonKey(defaultValue: 0)
  @override
  final int currentValue;
  @JsonKey(defaultValue: 0)
  @override
  final int updatedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Stat(currentValue: $currentValue, updatedValue: $updatedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Stat'))
      ..add(DiagnosticsProperty('currentValue', currentValue))
      ..add(DiagnosticsProperty('updatedValue', updatedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Stat &&
            (identical(other.currentValue, currentValue) ||
                const DeepCollectionEquality()
                    .equals(other.currentValue, currentValue)) &&
            (identical(other.updatedValue, updatedValue) ||
                const DeepCollectionEquality()
                    .equals(other.updatedValue, updatedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentValue) ^
      const DeepCollectionEquality().hash(updatedValue);

  @JsonKey(ignore: true)
  @override
  _$StatCopyWith<_Stat> get copyWith =>
      __$StatCopyWithImpl<_Stat>(this, _$identity);
}

abstract class _Stat extends Stat {
  factory _Stat({int currentValue, int updatedValue}) = _$_Stat;
  _Stat._() : super._();

  @override
  int get currentValue => throw _privateConstructorUsedError;
  @override
  int get updatedValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StatCopyWith<_Stat> get copyWith => throw _privateConstructorUsedError;
}
