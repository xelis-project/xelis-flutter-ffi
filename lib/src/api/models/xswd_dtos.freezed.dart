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
mixin _$AppInfo {
  String get id;
  String get name;
  String get description;
  String? get url;
  Map<String, PermissionPolicy> get permissions;

  /// Create a copy of AppInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppInfoCopyWith<AppInfo> get copyWith =>
      _$AppInfoCopyWithImpl<AppInfo>(this as AppInfo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality()
                .equals(other.permissions, permissions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, url,
      const DeepCollectionEquality().hash(permissions));

  @override
  String toString() {
    return 'AppInfo(id: $id, name: $name, description: $description, url: $url, permissions: $permissions)';
  }
}

/// @nodoc
abstract mixin class $AppInfoCopyWith<$Res> {
  factory $AppInfoCopyWith(AppInfo value, $Res Function(AppInfo) _then) =
      _$AppInfoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String? url,
      Map<String, PermissionPolicy> permissions});
}

/// @nodoc
class _$AppInfoCopyWithImpl<$Res> implements $AppInfoCopyWith<$Res> {
  _$AppInfoCopyWithImpl(this._self, this._then);

  final AppInfo _self;
  final $Res Function(AppInfo) _then;

  /// Create a copy of AppInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? url = freezed,
    Object? permissions = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      permissions: null == permissions
          ? _self.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Map<String, PermissionPolicy>,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppInfo].
extension AppInfoPatterns on AppInfo {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AppInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppInfo() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_AppInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppInfo():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AppInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppInfo() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, String description, String? url,
            Map<String, PermissionPolicy> permissions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppInfo() when $default != null:
        return $default(_that.id, _that.name, _that.description, _that.url,
            _that.permissions);
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
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, String description, String? url,
            Map<String, PermissionPolicy> permissions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppInfo():
        return $default(_that.id, _that.name, _that.description, _that.url,
            _that.permissions);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, String description, String? url,
            Map<String, PermissionPolicy> permissions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppInfo() when $default != null:
        return $default(_that.id, _that.name, _that.description, _that.url,
            _that.permissions);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AppInfo implements AppInfo {
  const _AppInfo(
      {required this.id,
      required this.name,
      required this.description,
      this.url,
      required final Map<String, PermissionPolicy> permissions})
      : _permissions = permissions;

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String? url;
  final Map<String, PermissionPolicy> _permissions;
  @override
  Map<String, PermissionPolicy> get permissions {
    if (_permissions is EqualUnmodifiableMapView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_permissions);
  }

  /// Create a copy of AppInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppInfoCopyWith<_AppInfo> get copyWith =>
      __$AppInfoCopyWithImpl<_AppInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, url,
      const DeepCollectionEquality().hash(_permissions));

  @override
  String toString() {
    return 'AppInfo(id: $id, name: $name, description: $description, url: $url, permissions: $permissions)';
  }
}

/// @nodoc
abstract mixin class _$AppInfoCopyWith<$Res> implements $AppInfoCopyWith<$Res> {
  factory _$AppInfoCopyWith(_AppInfo value, $Res Function(_AppInfo) _then) =
      __$AppInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String? url,
      Map<String, PermissionPolicy> permissions});
}

/// @nodoc
class __$AppInfoCopyWithImpl<$Res> implements _$AppInfoCopyWith<$Res> {
  __$AppInfoCopyWithImpl(this._self, this._then);

  final _AppInfo _self;
  final $Res Function(_AppInfo) _then;

  /// Create a copy of AppInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? url = freezed,
    Object? permissions = null,
  }) {
    return _then(_AppInfo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      permissions: null == permissions
          ? _self._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Map<String, PermissionPolicy>,
    ));
  }
}

/// @nodoc
mixin _$XswdRequestSummary {
  XswdRequestType get eventType;
  AppInfo get applicationInfo;

  /// Create a copy of XswdRequestSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $XswdRequestSummaryCopyWith<XswdRequestSummary> get copyWith =>
      _$XswdRequestSummaryCopyWithImpl<XswdRequestSummary>(
          this as XswdRequestSummary, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XswdRequestSummary &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.applicationInfo, applicationInfo) ||
                other.applicationInfo == applicationInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventType, applicationInfo);

  @override
  String toString() {
    return 'XswdRequestSummary(eventType: $eventType, applicationInfo: $applicationInfo)';
  }
}

/// @nodoc
abstract mixin class $XswdRequestSummaryCopyWith<$Res> {
  factory $XswdRequestSummaryCopyWith(
          XswdRequestSummary value, $Res Function(XswdRequestSummary) _then) =
      _$XswdRequestSummaryCopyWithImpl;
  @useResult
  $Res call({XswdRequestType eventType, AppInfo applicationInfo});

  $XswdRequestTypeCopyWith<$Res> get eventType;
  $AppInfoCopyWith<$Res> get applicationInfo;
}

/// @nodoc
class _$XswdRequestSummaryCopyWithImpl<$Res>
    implements $XswdRequestSummaryCopyWith<$Res> {
  _$XswdRequestSummaryCopyWithImpl(this._self, this._then);

  final XswdRequestSummary _self;
  final $Res Function(XswdRequestSummary) _then;

  /// Create a copy of XswdRequestSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = null,
    Object? applicationInfo = null,
  }) {
    return _then(_self.copyWith(
      eventType: null == eventType
          ? _self.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as XswdRequestType,
      applicationInfo: null == applicationInfo
          ? _self.applicationInfo
          : applicationInfo // ignore: cast_nullable_to_non_nullable
              as AppInfo,
    ));
  }

  /// Create a copy of XswdRequestSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XswdRequestTypeCopyWith<$Res> get eventType {
    return $XswdRequestTypeCopyWith<$Res>(_self.eventType, (value) {
      return _then(_self.copyWith(eventType: value));
    });
  }

  /// Create a copy of XswdRequestSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppInfoCopyWith<$Res> get applicationInfo {
    return $AppInfoCopyWith<$Res>(_self.applicationInfo, (value) {
      return _then(_self.copyWith(applicationInfo: value));
    });
  }
}

/// Adds pattern-matching-related methods to [XswdRequestSummary].
extension XswdRequestSummaryPatterns on XswdRequestSummary {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_XswdRequestSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _XswdRequestSummary() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_XswdRequestSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XswdRequestSummary():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_XswdRequestSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XswdRequestSummary() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(XswdRequestType eventType, AppInfo applicationInfo)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _XswdRequestSummary() when $default != null:
        return $default(_that.eventType, _that.applicationInfo);
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
  TResult when<TResult extends Object?>(
    TResult Function(XswdRequestType eventType, AppInfo applicationInfo)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XswdRequestSummary():
        return $default(_that.eventType, _that.applicationInfo);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(XswdRequestType eventType, AppInfo applicationInfo)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XswdRequestSummary() when $default != null:
        return $default(_that.eventType, _that.applicationInfo);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _XswdRequestSummary extends XswdRequestSummary {
  const _XswdRequestSummary(
      {required this.eventType, required this.applicationInfo})
      : super._();

  @override
  final XswdRequestType eventType;
  @override
  final AppInfo applicationInfo;

  /// Create a copy of XswdRequestSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$XswdRequestSummaryCopyWith<_XswdRequestSummary> get copyWith =>
      __$XswdRequestSummaryCopyWithImpl<_XswdRequestSummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _XswdRequestSummary &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.applicationInfo, applicationInfo) ||
                other.applicationInfo == applicationInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventType, applicationInfo);

  @override
  String toString() {
    return 'XswdRequestSummary(eventType: $eventType, applicationInfo: $applicationInfo)';
  }
}

/// @nodoc
abstract mixin class _$XswdRequestSummaryCopyWith<$Res>
    implements $XswdRequestSummaryCopyWith<$Res> {
  factory _$XswdRequestSummaryCopyWith(
          _XswdRequestSummary value, $Res Function(_XswdRequestSummary) _then) =
      __$XswdRequestSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({XswdRequestType eventType, AppInfo applicationInfo});

  @override
  $XswdRequestTypeCopyWith<$Res> get eventType;
  @override
  $AppInfoCopyWith<$Res> get applicationInfo;
}

/// @nodoc
class __$XswdRequestSummaryCopyWithImpl<$Res>
    implements _$XswdRequestSummaryCopyWith<$Res> {
  __$XswdRequestSummaryCopyWithImpl(this._self, this._then);

  final _XswdRequestSummary _self;
  final $Res Function(_XswdRequestSummary) _then;

  /// Create a copy of XswdRequestSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eventType = null,
    Object? applicationInfo = null,
  }) {
    return _then(_XswdRequestSummary(
      eventType: null == eventType
          ? _self.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as XswdRequestType,
      applicationInfo: null == applicationInfo
          ? _self.applicationInfo
          : applicationInfo // ignore: cast_nullable_to_non_nullable
              as AppInfo,
    ));
  }

  /// Create a copy of XswdRequestSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XswdRequestTypeCopyWith<$Res> get eventType {
    return $XswdRequestTypeCopyWith<$Res>(_self.eventType, (value) {
      return _then(_self.copyWith(eventType: value));
    });
  }

  /// Create a copy of XswdRequestSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppInfoCopyWith<$Res> get applicationInfo {
    return $AppInfoCopyWith<$Res>(_self.applicationInfo, (value) {
      return _then(_self.copyWith(applicationInfo: value));
    });
  }
}

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
    TResult Function(XswdRequestType_PrefetchPermissions value)?
        prefetchPermissions,
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
      case XswdRequestType_PrefetchPermissions()
          when prefetchPermissions != null:
        return prefetchPermissions(_that);
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
    required TResult Function(XswdRequestType_PrefetchPermissions value)
        prefetchPermissions,
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
      case XswdRequestType_PrefetchPermissions():
        return prefetchPermissions(_that);
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
    TResult? Function(XswdRequestType_PrefetchPermissions value)?
        prefetchPermissions,
    TResult? Function(XswdRequestType_CancelRequest value)? cancelRequest,
    TResult? Function(XswdRequestType_AppDisconnect value)? appDisconnect,
  }) {
    final _that = this;
    switch (_that) {
      case XswdRequestType_Application() when application != null:
        return application(_that);
      case XswdRequestType_Permission() when permission != null:
        return permission(_that);
      case XswdRequestType_PrefetchPermissions()
          when prefetchPermissions != null:
        return prefetchPermissions(_that);
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
    TResult Function(String field0)? prefetchPermissions,
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
      case XswdRequestType_PrefetchPermissions()
          when prefetchPermissions != null:
        return prefetchPermissions(_that.field0);
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
    required TResult Function(String field0) prefetchPermissions,
    required TResult Function() cancelRequest,
    required TResult Function() appDisconnect,
  }) {
    final _that = this;
    switch (_that) {
      case XswdRequestType_Application():
        return application();
      case XswdRequestType_Permission():
        return permission(_that.field0);
      case XswdRequestType_PrefetchPermissions():
        return prefetchPermissions(_that.field0);
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
    TResult? Function(String field0)? prefetchPermissions,
    TResult? Function()? cancelRequest,
    TResult? Function()? appDisconnect,
  }) {
    final _that = this;
    switch (_that) {
      case XswdRequestType_Application() when application != null:
        return application();
      case XswdRequestType_Permission() when permission != null:
        return permission(_that.field0);
      case XswdRequestType_PrefetchPermissions()
          when prefetchPermissions != null:
        return prefetchPermissions(_that.field0);
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

class XswdRequestType_PrefetchPermissions extends XswdRequestType {
  const XswdRequestType_PrefetchPermissions(this.field0) : super._();

  final String field0;

  /// Create a copy of XswdRequestType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $XswdRequestType_PrefetchPermissionsCopyWith<
          XswdRequestType_PrefetchPermissions>
      get copyWith => _$XswdRequestType_PrefetchPermissionsCopyWithImpl<
          XswdRequestType_PrefetchPermissions>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XswdRequestType_PrefetchPermissions &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'XswdRequestType.prefetchPermissions(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $XswdRequestType_PrefetchPermissionsCopyWith<$Res>
    implements $XswdRequestTypeCopyWith<$Res> {
  factory $XswdRequestType_PrefetchPermissionsCopyWith(
          XswdRequestType_PrefetchPermissions value,
          $Res Function(XswdRequestType_PrefetchPermissions) _then) =
      _$XswdRequestType_PrefetchPermissionsCopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$XswdRequestType_PrefetchPermissionsCopyWithImpl<$Res>
    implements $XswdRequestType_PrefetchPermissionsCopyWith<$Res> {
  _$XswdRequestType_PrefetchPermissionsCopyWithImpl(this._self, this._then);

  final XswdRequestType_PrefetchPermissions _self;
  final $Res Function(XswdRequestType_PrefetchPermissions) _then;

  /// Create a copy of XswdRequestType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(XswdRequestType_PrefetchPermissions(
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
