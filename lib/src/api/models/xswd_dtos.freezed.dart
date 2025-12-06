// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xswd_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$XswdRequestType {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is XswdRequestType);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'XswdRequestType()';
  }
}

/// @nodoc
class $XswdRequestTypeCopyWith<$Res> {
  $XswdRequestTypeCopyWith(
      XswdRequestType _, $Res Function(XswdRequestType) __);
}

/// Adds pattern-matching-related methods to [XswdRequestType].
extension XswdRequestTypePatterns on XswdRequestType {
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
    TResult Function(XswdRequestType_Application value)? application,
    TResult Function(XswdRequestType_Permission value)? permission,
    TResult Function(XswdRequestType_CancelRequest value)? cancelRequest,
    TResult Function(XswdRequestType_AppDisconnect value)? appDisconnect,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case XswdRequestType_Application() when application != null:
        return application(_that);
      case XswdRequestType_Permission() when permission != null:
        return permission(_that);
      case XswdRequestType_CancelRequest() when cancelRequest != null:
        return cancelRequest(_that);
      case XswdRequestType_AppDisconnect() when appDisconnect != null:
        return appDisconnect(_that);
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
    required TResult Function(XswdRequestType_Application value) application,
    required TResult Function(XswdRequestType_Permission value) permission,
    required TResult Function(XswdRequestType_CancelRequest value)
        cancelRequest,
    required TResult Function(XswdRequestType_AppDisconnect value)
        appDisconnect,
  }) {
    final _that = this;
    switch (_that) {
      case XswdRequestType_Application():
        return application(_that);
      case XswdRequestType_Permission():
        return permission(_that);
      case XswdRequestType_CancelRequest():
        return cancelRequest(_that);
      case XswdRequestType_AppDisconnect():
        return appDisconnect(_that);
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
    TResult? Function(XswdRequestType_Application value)? application,
    TResult? Function(XswdRequestType_Permission value)? permission,
    TResult? Function(XswdRequestType_CancelRequest value)? cancelRequest,
    TResult? Function(XswdRequestType_AppDisconnect value)? appDisconnect,
  }) {
    final _that = this;
    switch (_that) {
      case XswdRequestType_Application() when application != null:
        return application(_that);
      case XswdRequestType_Permission() when permission != null:
        return permission(_that);
      case XswdRequestType_CancelRequest() when cancelRequest != null:
        return cancelRequest(_that);
      case XswdRequestType_AppDisconnect() when appDisconnect != null:
        return appDisconnect(_that);
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
    TResult Function()? application,
    TResult Function(String field0)? permission,
    TResult Function()? cancelRequest,
    TResult Function()? appDisconnect,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case XswdRequestType_Application() when application != null:
        return application();
      case XswdRequestType_Permission() when permission != null:
        return permission(_that.field0);
      case XswdRequestType_CancelRequest() when cancelRequest != null:
        return cancelRequest();
      case XswdRequestType_AppDisconnect() when appDisconnect != null:
        return appDisconnect();
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
    required TResult Function() application,
    required TResult Function(String field0) permission,
    required TResult Function() cancelRequest,
    required TResult Function() appDisconnect,
  }) {
    final _that = this;
    switch (_that) {
      case XswdRequestType_Application():
        return application();
      case XswdRequestType_Permission():
        return permission(_that.field0);
      case XswdRequestType_CancelRequest():
        return cancelRequest();
      case XswdRequestType_AppDisconnect():
        return appDisconnect();
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
    TResult? Function()? application,
    TResult? Function(String field0)? permission,
    TResult? Function()? cancelRequest,
    TResult? Function()? appDisconnect,
  }) {
    final _that = this;
    switch (_that) {
      case XswdRequestType_Application() when application != null:
        return application();
      case XswdRequestType_Permission() when permission != null:
        return permission(_that.field0);
      case XswdRequestType_CancelRequest() when cancelRequest != null:
        return cancelRequest();
      case XswdRequestType_AppDisconnect() when appDisconnect != null:
        return appDisconnect();
      case _:
        return null;
    }
  }
}

/// @nodoc

class XswdRequestType_Application extends XswdRequestType {
  const XswdRequestType_Application() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XswdRequestType_Application);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'XswdRequestType.application()';
  }
}

/// @nodoc

class XswdRequestType_Permission extends XswdRequestType {
  const XswdRequestType_Permission(this.field0) : super._();

  final String field0;

  /// Create a copy of XswdRequestType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $XswdRequestType_PermissionCopyWith<XswdRequestType_Permission>
      get copyWith =>
          _$XswdRequestType_PermissionCopyWithImpl<XswdRequestType_Permission>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XswdRequestType_Permission &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'XswdRequestType.permission(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $XswdRequestType_PermissionCopyWith<$Res>
    implements $XswdRequestTypeCopyWith<$Res> {
  factory $XswdRequestType_PermissionCopyWith(XswdRequestType_Permission value,
          $Res Function(XswdRequestType_Permission) _then) =
      _$XswdRequestType_PermissionCopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$XswdRequestType_PermissionCopyWithImpl<$Res>
    implements $XswdRequestType_PermissionCopyWith<$Res> {
  _$XswdRequestType_PermissionCopyWithImpl(this._self, this._then);

  final XswdRequestType_Permission _self;
  final $Res Function(XswdRequestType_Permission) _then;

  /// Create a copy of XswdRequestType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(XswdRequestType_Permission(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class XswdRequestType_CancelRequest extends XswdRequestType {
  const XswdRequestType_CancelRequest() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XswdRequestType_CancelRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'XswdRequestType.cancelRequest()';
  }
}

/// @nodoc

class XswdRequestType_AppDisconnect extends XswdRequestType {
  const XswdRequestType_AppDisconnect() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XswdRequestType_AppDisconnect);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'XswdRequestType.appDisconnect()';
  }
}

// dart format on
