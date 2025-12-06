// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'precomputed_tables.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrecomputedTableType {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PrecomputedTableType);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PrecomputedTableType()';
  }
}

/// @nodoc
class $PrecomputedTableTypeCopyWith<$Res> {
  $PrecomputedTableTypeCopyWith(
      PrecomputedTableType _, $Res Function(PrecomputedTableType) __);
}

/// Adds pattern-matching-related methods to [PrecomputedTableType].
extension PrecomputedTableTypePatterns on PrecomputedTableType {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PrecomputedTableType_L1Low value)? l1Low,
    TResult Function(PrecomputedTableType_L1Medium value)? l1Medium,
    TResult Function(PrecomputedTableType_L1Full value)? l1Full,
    TResult Function(PrecomputedTableType_Custom value)? custom,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PrecomputedTableType_L1Low() when l1Low != null:
        return l1Low(_that);
      case PrecomputedTableType_L1Medium() when l1Medium != null:
        return l1Medium(_that);
      case PrecomputedTableType_L1Full() when l1Full != null:
        return l1Full(_that);
      case PrecomputedTableType_Custom() when custom != null:
        return custom(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PrecomputedTableType_L1Low value) l1Low,
    required TResult Function(PrecomputedTableType_L1Medium value) l1Medium,
    required TResult Function(PrecomputedTableType_L1Full value) l1Full,
    required TResult Function(PrecomputedTableType_Custom value) custom,
  }) {
    final _that = this;
    switch (_that) {
      case PrecomputedTableType_L1Low():
        return l1Low(_that);
      case PrecomputedTableType_L1Medium():
        return l1Medium(_that);
      case PrecomputedTableType_L1Full():
        return l1Full(_that);
      case PrecomputedTableType_Custom():
        return custom(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PrecomputedTableType_L1Low value)? l1Low,
    TResult? Function(PrecomputedTableType_L1Medium value)? l1Medium,
    TResult? Function(PrecomputedTableType_L1Full value)? l1Full,
    TResult? Function(PrecomputedTableType_Custom value)? custom,
  }) {
    final _that = this;
    switch (_that) {
      case PrecomputedTableType_L1Low() when l1Low != null:
        return l1Low(_that);
      case PrecomputedTableType_L1Medium() when l1Medium != null:
        return l1Medium(_that);
      case PrecomputedTableType_L1Full() when l1Full != null:
        return l1Full(_that);
      case PrecomputedTableType_Custom() when custom != null:
        return custom(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? l1Low,
    TResult Function()? l1Medium,
    TResult Function()? l1Full,
    TResult Function(BigInt field0)? custom,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PrecomputedTableType_L1Low() when l1Low != null:
        return l1Low();
      case PrecomputedTableType_L1Medium() when l1Medium != null:
        return l1Medium();
      case PrecomputedTableType_L1Full() when l1Full != null:
        return l1Full();
      case PrecomputedTableType_Custom() when custom != null:
        return custom(_that.field0);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() l1Low,
    required TResult Function() l1Medium,
    required TResult Function() l1Full,
    required TResult Function(BigInt field0) custom,
  }) {
    final _that = this;
    switch (_that) {
      case PrecomputedTableType_L1Low():
        return l1Low();
      case PrecomputedTableType_L1Medium():
        return l1Medium();
      case PrecomputedTableType_L1Full():
        return l1Full();
      case PrecomputedTableType_Custom():
        return custom(_that.field0);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? l1Low,
    TResult? Function()? l1Medium,
    TResult? Function()? l1Full,
    TResult? Function(BigInt field0)? custom,
  }) {
    final _that = this;
    switch (_that) {
      case PrecomputedTableType_L1Low() when l1Low != null:
        return l1Low();
      case PrecomputedTableType_L1Medium() when l1Medium != null:
        return l1Medium();
      case PrecomputedTableType_L1Full() when l1Full != null:
        return l1Full();
      case PrecomputedTableType_Custom() when custom != null:
        return custom(_that.field0);
      case _:
        return null;
    }
  }
}

/// @nodoc

class PrecomputedTableType_L1Low extends PrecomputedTableType {
  const PrecomputedTableType_L1Low() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrecomputedTableType_L1Low);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PrecomputedTableType.l1Low()';
  }
}

/// @nodoc

class PrecomputedTableType_L1Medium extends PrecomputedTableType {
  const PrecomputedTableType_L1Medium() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrecomputedTableType_L1Medium);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PrecomputedTableType.l1Medium()';
  }
}

/// @nodoc

class PrecomputedTableType_L1Full extends PrecomputedTableType {
  const PrecomputedTableType_L1Full() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrecomputedTableType_L1Full);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PrecomputedTableType.l1Full()';
  }
}

/// @nodoc

class PrecomputedTableType_Custom extends PrecomputedTableType {
  const PrecomputedTableType_Custom(this.field0) : super._();

  final BigInt field0;

  /// Create a copy of PrecomputedTableType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PrecomputedTableType_CustomCopyWith<PrecomputedTableType_Custom>
      get copyWith => _$PrecomputedTableType_CustomCopyWithImpl<
          PrecomputedTableType_Custom>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrecomputedTableType_Custom &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'PrecomputedTableType.custom(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $PrecomputedTableType_CustomCopyWith<$Res>
    implements $PrecomputedTableTypeCopyWith<$Res> {
  factory $PrecomputedTableType_CustomCopyWith(
          PrecomputedTableType_Custom value,
          $Res Function(PrecomputedTableType_Custom) _then) =
      _$PrecomputedTableType_CustomCopyWithImpl;
  @useResult
  $Res call({BigInt field0});
}

/// @nodoc
class _$PrecomputedTableType_CustomCopyWithImpl<$Res>
    implements $PrecomputedTableType_CustomCopyWith<$Res> {
  _$PrecomputedTableType_CustomCopyWithImpl(this._self, this._then);

  final PrecomputedTableType_Custom _self;
  final $Res Function(PrecomputedTableType_Custom) _then;

  /// Create a copy of PrecomputedTableType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(PrecomputedTableType_Custom(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

// dart format on
