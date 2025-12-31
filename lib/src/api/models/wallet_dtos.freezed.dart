// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryPageFilter {
  BigInt get page;
  BigInt? get limit;
  String? get assetHash;
  String? get address;
  BigInt? get minTopoheight;
  BigInt? get maxTopoheight;
  bool get acceptIncoming;
  bool get acceptOutgoing;
  bool get acceptCoinbase;
  bool get acceptBurn;

  /// Create a copy of HistoryPageFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HistoryPageFilterCopyWith<HistoryPageFilter> get copyWith =>
      _$HistoryPageFilterCopyWithImpl<HistoryPageFilter>(
          this as HistoryPageFilter, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HistoryPageFilter &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.assetHash, assetHash) ||
                other.assetHash == assetHash) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.minTopoheight, minTopoheight) ||
                other.minTopoheight == minTopoheight) &&
            (identical(other.maxTopoheight, maxTopoheight) ||
                other.maxTopoheight == maxTopoheight) &&
            (identical(other.acceptIncoming, acceptIncoming) ||
                other.acceptIncoming == acceptIncoming) &&
            (identical(other.acceptOutgoing, acceptOutgoing) ||
                other.acceptOutgoing == acceptOutgoing) &&
            (identical(other.acceptCoinbase, acceptCoinbase) ||
                other.acceptCoinbase == acceptCoinbase) &&
            (identical(other.acceptBurn, acceptBurn) ||
                other.acceptBurn == acceptBurn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      page,
      limit,
      assetHash,
      address,
      minTopoheight,
      maxTopoheight,
      acceptIncoming,
      acceptOutgoing,
      acceptCoinbase,
      acceptBurn);

  @override
  String toString() {
    return 'HistoryPageFilter(page: $page, limit: $limit, assetHash: $assetHash, address: $address, minTopoheight: $minTopoheight, maxTopoheight: $maxTopoheight, acceptIncoming: $acceptIncoming, acceptOutgoing: $acceptOutgoing, acceptCoinbase: $acceptCoinbase, acceptBurn: $acceptBurn)';
  }
}

/// @nodoc
abstract mixin class $HistoryPageFilterCopyWith<$Res> {
  factory $HistoryPageFilterCopyWith(
          HistoryPageFilter value, $Res Function(HistoryPageFilter) _then) =
      _$HistoryPageFilterCopyWithImpl;
  @useResult
  $Res call(
      {BigInt page,
      BigInt? limit,
      String? assetHash,
      String? address,
      BigInt? minTopoheight,
      BigInt? maxTopoheight,
      bool acceptIncoming,
      bool acceptOutgoing,
      bool acceptCoinbase,
      bool acceptBurn});
}

/// @nodoc
class _$HistoryPageFilterCopyWithImpl<$Res>
    implements $HistoryPageFilterCopyWith<$Res> {
  _$HistoryPageFilterCopyWithImpl(this._self, this._then);

  final HistoryPageFilter _self;
  final $Res Function(HistoryPageFilter) _then;

  /// Create a copy of HistoryPageFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = freezed,
    Object? assetHash = freezed,
    Object? address = freezed,
    Object? minTopoheight = freezed,
    Object? maxTopoheight = freezed,
    Object? acceptIncoming = null,
    Object? acceptOutgoing = null,
    Object? acceptCoinbase = null,
    Object? acceptBurn = null,
  }) {
    return _then(_self.copyWith(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as BigInt,
      limit: freezed == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      assetHash: freezed == assetHash
          ? _self.assetHash
          : assetHash // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      minTopoheight: freezed == minTopoheight
          ? _self.minTopoheight
          : minTopoheight // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      maxTopoheight: freezed == maxTopoheight
          ? _self.maxTopoheight
          : maxTopoheight // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      acceptIncoming: null == acceptIncoming
          ? _self.acceptIncoming
          : acceptIncoming // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptOutgoing: null == acceptOutgoing
          ? _self.acceptOutgoing
          : acceptOutgoing // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptCoinbase: null == acceptCoinbase
          ? _self.acceptCoinbase
          : acceptCoinbase // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptBurn: null == acceptBurn
          ? _self.acceptBurn
          : acceptBurn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [HistoryPageFilter].
extension HistoryPageFilterPatterns on HistoryPageFilter {
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
    TResult Function(_HistoryPageFilter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HistoryPageFilter() when $default != null:
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
    TResult Function(_HistoryPageFilter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryPageFilter():
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
    TResult? Function(_HistoryPageFilter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryPageFilter() when $default != null:
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
    TResult Function(
            BigInt page,
            BigInt? limit,
            String? assetHash,
            String? address,
            BigInt? minTopoheight,
            BigInt? maxTopoheight,
            bool acceptIncoming,
            bool acceptOutgoing,
            bool acceptCoinbase,
            bool acceptBurn)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HistoryPageFilter() when $default != null:
        return $default(
            _that.page,
            _that.limit,
            _that.assetHash,
            _that.address,
            _that.minTopoheight,
            _that.maxTopoheight,
            _that.acceptIncoming,
            _that.acceptOutgoing,
            _that.acceptCoinbase,
            _that.acceptBurn);
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
    TResult Function(
            BigInt page,
            BigInt? limit,
            String? assetHash,
            String? address,
            BigInt? minTopoheight,
            BigInt? maxTopoheight,
            bool acceptIncoming,
            bool acceptOutgoing,
            bool acceptCoinbase,
            bool acceptBurn)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryPageFilter():
        return $default(
            _that.page,
            _that.limit,
            _that.assetHash,
            _that.address,
            _that.minTopoheight,
            _that.maxTopoheight,
            _that.acceptIncoming,
            _that.acceptOutgoing,
            _that.acceptCoinbase,
            _that.acceptBurn);
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
    TResult? Function(
            BigInt page,
            BigInt? limit,
            String? assetHash,
            String? address,
            BigInt? minTopoheight,
            BigInt? maxTopoheight,
            bool acceptIncoming,
            bool acceptOutgoing,
            bool acceptCoinbase,
            bool acceptBurn)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HistoryPageFilter() when $default != null:
        return $default(
            _that.page,
            _that.limit,
            _that.assetHash,
            _that.address,
            _that.minTopoheight,
            _that.maxTopoheight,
            _that.acceptIncoming,
            _that.acceptOutgoing,
            _that.acceptCoinbase,
            _that.acceptBurn);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HistoryPageFilter implements HistoryPageFilter {
  const _HistoryPageFilter(
      {required this.page,
      this.limit,
      this.assetHash,
      this.address,
      this.minTopoheight,
      this.maxTopoheight,
      required this.acceptIncoming,
      required this.acceptOutgoing,
      required this.acceptCoinbase,
      required this.acceptBurn});

  @override
  final BigInt page;
  @override
  final BigInt? limit;
  @override
  final String? assetHash;
  @override
  final String? address;
  @override
  final BigInt? minTopoheight;
  @override
  final BigInt? maxTopoheight;
  @override
  final bool acceptIncoming;
  @override
  final bool acceptOutgoing;
  @override
  final bool acceptCoinbase;
  @override
  final bool acceptBurn;

  /// Create a copy of HistoryPageFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HistoryPageFilterCopyWith<_HistoryPageFilter> get copyWith =>
      __$HistoryPageFilterCopyWithImpl<_HistoryPageFilter>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoryPageFilter &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.assetHash, assetHash) ||
                other.assetHash == assetHash) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.minTopoheight, minTopoheight) ||
                other.minTopoheight == minTopoheight) &&
            (identical(other.maxTopoheight, maxTopoheight) ||
                other.maxTopoheight == maxTopoheight) &&
            (identical(other.acceptIncoming, acceptIncoming) ||
                other.acceptIncoming == acceptIncoming) &&
            (identical(other.acceptOutgoing, acceptOutgoing) ||
                other.acceptOutgoing == acceptOutgoing) &&
            (identical(other.acceptCoinbase, acceptCoinbase) ||
                other.acceptCoinbase == acceptCoinbase) &&
            (identical(other.acceptBurn, acceptBurn) ||
                other.acceptBurn == acceptBurn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      page,
      limit,
      assetHash,
      address,
      minTopoheight,
      maxTopoheight,
      acceptIncoming,
      acceptOutgoing,
      acceptCoinbase,
      acceptBurn);

  @override
  String toString() {
    return 'HistoryPageFilter(page: $page, limit: $limit, assetHash: $assetHash, address: $address, minTopoheight: $minTopoheight, maxTopoheight: $maxTopoheight, acceptIncoming: $acceptIncoming, acceptOutgoing: $acceptOutgoing, acceptCoinbase: $acceptCoinbase, acceptBurn: $acceptBurn)';
  }
}

/// @nodoc
abstract mixin class _$HistoryPageFilterCopyWith<$Res>
    implements $HistoryPageFilterCopyWith<$Res> {
  factory _$HistoryPageFilterCopyWith(
          _HistoryPageFilter value, $Res Function(_HistoryPageFilter) _then) =
      __$HistoryPageFilterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {BigInt page,
      BigInt? limit,
      String? assetHash,
      String? address,
      BigInt? minTopoheight,
      BigInt? maxTopoheight,
      bool acceptIncoming,
      bool acceptOutgoing,
      bool acceptCoinbase,
      bool acceptBurn});
}

/// @nodoc
class __$HistoryPageFilterCopyWithImpl<$Res>
    implements _$HistoryPageFilterCopyWith<$Res> {
  __$HistoryPageFilterCopyWithImpl(this._self, this._then);

  final _HistoryPageFilter _self;
  final $Res Function(_HistoryPageFilter) _then;

  /// Create a copy of HistoryPageFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
    Object? limit = freezed,
    Object? assetHash = freezed,
    Object? address = freezed,
    Object? minTopoheight = freezed,
    Object? maxTopoheight = freezed,
    Object? acceptIncoming = null,
    Object? acceptOutgoing = null,
    Object? acceptCoinbase = null,
    Object? acceptBurn = null,
  }) {
    return _then(_HistoryPageFilter(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as BigInt,
      limit: freezed == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      assetHash: freezed == assetHash
          ? _self.assetHash
          : assetHash // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      minTopoheight: freezed == minTopoheight
          ? _self.minTopoheight
          : minTopoheight // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      maxTopoheight: freezed == maxTopoheight
          ? _self.maxTopoheight
          : maxTopoheight // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      acceptIncoming: null == acceptIncoming
          ? _self.acceptIncoming
          : acceptIncoming // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptOutgoing: null == acceptOutgoing
          ? _self.acceptOutgoing
          : acceptOutgoing // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptCoinbase: null == acceptCoinbase
          ? _self.acceptCoinbase
          : acceptCoinbase // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptBurn: null == acceptBurn
          ? _self.acceptBurn
          : acceptBurn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$SignatureMultisig {
  int get id;
  String get signature;

  /// Create a copy of SignatureMultisig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignatureMultisigCopyWith<SignatureMultisig> get copyWith =>
      _$SignatureMultisigCopyWithImpl<SignatureMultisig>(
          this as SignatureMultisig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignatureMultisig &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.signature, signature) ||
                other.signature == signature));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, signature);

  @override
  String toString() {
    return 'SignatureMultisig(id: $id, signature: $signature)';
  }
}

/// @nodoc
abstract mixin class $SignatureMultisigCopyWith<$Res> {
  factory $SignatureMultisigCopyWith(
          SignatureMultisig value, $Res Function(SignatureMultisig) _then) =
      _$SignatureMultisigCopyWithImpl;
  @useResult
  $Res call({int id, String signature});
}

/// @nodoc
class _$SignatureMultisigCopyWithImpl<$Res>
    implements $SignatureMultisigCopyWith<$Res> {
  _$SignatureMultisigCopyWithImpl(this._self, this._then);

  final SignatureMultisig _self;
  final $Res Function(SignatureMultisig) _then;

  /// Create a copy of SignatureMultisig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? signature = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      signature: null == signature
          ? _self.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SignatureMultisig].
extension SignatureMultisigPatterns on SignatureMultisig {
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
    TResult Function(_SignatureMultisig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignatureMultisig() when $default != null:
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
    TResult Function(_SignatureMultisig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignatureMultisig():
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
    TResult? Function(_SignatureMultisig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignatureMultisig() when $default != null:
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
    TResult Function(int id, String signature)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignatureMultisig() when $default != null:
        return $default(_that.id, _that.signature);
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
    TResult Function(int id, String signature) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignatureMultisig():
        return $default(_that.id, _that.signature);
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
    TResult? Function(int id, String signature)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignatureMultisig() when $default != null:
        return $default(_that.id, _that.signature);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SignatureMultisig implements SignatureMultisig {
  const _SignatureMultisig({required this.id, required this.signature});

  @override
  final int id;
  @override
  final String signature;

  /// Create a copy of SignatureMultisig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignatureMultisigCopyWith<_SignatureMultisig> get copyWith =>
      __$SignatureMultisigCopyWithImpl<_SignatureMultisig>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignatureMultisig &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.signature, signature) ||
                other.signature == signature));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, signature);

  @override
  String toString() {
    return 'SignatureMultisig(id: $id, signature: $signature)';
  }
}

/// @nodoc
abstract mixin class _$SignatureMultisigCopyWith<$Res>
    implements $SignatureMultisigCopyWith<$Res> {
  factory _$SignatureMultisigCopyWith(
          _SignatureMultisig value, $Res Function(_SignatureMultisig) _then) =
      __$SignatureMultisigCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String signature});
}

/// @nodoc
class __$SignatureMultisigCopyWithImpl<$Res>
    implements _$SignatureMultisigCopyWith<$Res> {
  __$SignatureMultisigCopyWithImpl(this._self, this._then);

  final _SignatureMultisig _self;
  final $Res Function(_SignatureMultisig) _then;

  /// Create a copy of SignatureMultisig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? signature = null,
  }) {
    return _then(_SignatureMultisig(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      signature: null == signature
          ? _self.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Transfer {
  double get floatAmount;
  String get strAddress;
  String get assetHash;
  String? get extraData;
  bool? get encryptExtraData;

  /// Create a copy of Transfer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransferCopyWith<Transfer> get copyWith =>
      _$TransferCopyWithImpl<Transfer>(this as Transfer, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Transfer &&
            (identical(other.floatAmount, floatAmount) ||
                other.floatAmount == floatAmount) &&
            (identical(other.strAddress, strAddress) ||
                other.strAddress == strAddress) &&
            (identical(other.assetHash, assetHash) ||
                other.assetHash == assetHash) &&
            (identical(other.extraData, extraData) ||
                other.extraData == extraData) &&
            (identical(other.encryptExtraData, encryptExtraData) ||
                other.encryptExtraData == encryptExtraData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, floatAmount, strAddress,
      assetHash, extraData, encryptExtraData);

  @override
  String toString() {
    return 'Transfer(floatAmount: $floatAmount, strAddress: $strAddress, assetHash: $assetHash, extraData: $extraData, encryptExtraData: $encryptExtraData)';
  }
}

/// @nodoc
abstract mixin class $TransferCopyWith<$Res> {
  factory $TransferCopyWith(Transfer value, $Res Function(Transfer) _then) =
      _$TransferCopyWithImpl;
  @useResult
  $Res call(
      {double floatAmount,
      String strAddress,
      String assetHash,
      String? extraData,
      bool? encryptExtraData});
}

/// @nodoc
class _$TransferCopyWithImpl<$Res> implements $TransferCopyWith<$Res> {
  _$TransferCopyWithImpl(this._self, this._then);

  final Transfer _self;
  final $Res Function(Transfer) _then;

  /// Create a copy of Transfer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floatAmount = null,
    Object? strAddress = null,
    Object? assetHash = null,
    Object? extraData = freezed,
    Object? encryptExtraData = freezed,
  }) {
    return _then(_self.copyWith(
      floatAmount: null == floatAmount
          ? _self.floatAmount
          : floatAmount // ignore: cast_nullable_to_non_nullable
              as double,
      strAddress: null == strAddress
          ? _self.strAddress
          : strAddress // ignore: cast_nullable_to_non_nullable
              as String,
      assetHash: null == assetHash
          ? _self.assetHash
          : assetHash // ignore: cast_nullable_to_non_nullable
              as String,
      extraData: freezed == extraData
          ? _self.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as String?,
      encryptExtraData: freezed == encryptExtraData
          ? _self.encryptExtraData
          : encryptExtraData // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Transfer].
extension TransferPatterns on Transfer {
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
    TResult Function(_Transfer value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Transfer() when $default != null:
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
    TResult Function(_Transfer value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Transfer():
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
    TResult? Function(_Transfer value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Transfer() when $default != null:
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
    TResult Function(double floatAmount, String strAddress, String assetHash,
            String? extraData, bool? encryptExtraData)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Transfer() when $default != null:
        return $default(_that.floatAmount, _that.strAddress, _that.assetHash,
            _that.extraData, _that.encryptExtraData);
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
    TResult Function(double floatAmount, String strAddress, String assetHash,
            String? extraData, bool? encryptExtraData)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Transfer():
        return $default(_that.floatAmount, _that.strAddress, _that.assetHash,
            _that.extraData, _that.encryptExtraData);
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
    TResult? Function(double floatAmount, String strAddress, String assetHash,
            String? extraData, bool? encryptExtraData)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Transfer() when $default != null:
        return $default(_that.floatAmount, _that.strAddress, _that.assetHash,
            _that.extraData, _that.encryptExtraData);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Transfer implements Transfer {
  const _Transfer(
      {required this.floatAmount,
      required this.strAddress,
      required this.assetHash,
      this.extraData,
      this.encryptExtraData});

  @override
  final double floatAmount;
  @override
  final String strAddress;
  @override
  final String assetHash;
  @override
  final String? extraData;
  @override
  final bool? encryptExtraData;

  /// Create a copy of Transfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TransferCopyWith<_Transfer> get copyWith =>
      __$TransferCopyWithImpl<_Transfer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Transfer &&
            (identical(other.floatAmount, floatAmount) ||
                other.floatAmount == floatAmount) &&
            (identical(other.strAddress, strAddress) ||
                other.strAddress == strAddress) &&
            (identical(other.assetHash, assetHash) ||
                other.assetHash == assetHash) &&
            (identical(other.extraData, extraData) ||
                other.extraData == extraData) &&
            (identical(other.encryptExtraData, encryptExtraData) ||
                other.encryptExtraData == encryptExtraData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, floatAmount, strAddress,
      assetHash, extraData, encryptExtraData);

  @override
  String toString() {
    return 'Transfer(floatAmount: $floatAmount, strAddress: $strAddress, assetHash: $assetHash, extraData: $extraData, encryptExtraData: $encryptExtraData)';
  }
}

/// @nodoc
abstract mixin class _$TransferCopyWith<$Res>
    implements $TransferCopyWith<$Res> {
  factory _$TransferCopyWith(_Transfer value, $Res Function(_Transfer) _then) =
      __$TransferCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double floatAmount,
      String strAddress,
      String assetHash,
      String? extraData,
      bool? encryptExtraData});
}

/// @nodoc
class __$TransferCopyWithImpl<$Res> implements _$TransferCopyWith<$Res> {
  __$TransferCopyWithImpl(this._self, this._then);

  final _Transfer _self;
  final $Res Function(_Transfer) _then;

  /// Create a copy of Transfer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? floatAmount = null,
    Object? strAddress = null,
    Object? assetHash = null,
    Object? extraData = freezed,
    Object? encryptExtraData = freezed,
  }) {
    return _then(_Transfer(
      floatAmount: null == floatAmount
          ? _self.floatAmount
          : floatAmount // ignore: cast_nullable_to_non_nullable
              as double,
      strAddress: null == strAddress
          ? _self.strAddress
          : strAddress // ignore: cast_nullable_to_non_nullable
              as String,
      assetHash: null == assetHash
          ? _self.assetHash
          : assetHash // ignore: cast_nullable_to_non_nullable
              as String,
      extraData: freezed == extraData
          ? _self.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as String?,
      encryptExtraData: freezed == encryptExtraData
          ? _self.encryptExtraData
          : encryptExtraData // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
mixin _$XelisAssetMetadata {
  String get name;
  String get ticker;
  int get decimals;
  XelisMaxSupplyMode get maxSupply;
  XelisAssetOwner? get owner;

  /// Create a copy of XelisAssetMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $XelisAssetMetadataCopyWith<XelisAssetMetadata> get copyWith =>
      _$XelisAssetMetadataCopyWithImpl<XelisAssetMetadata>(
          this as XelisAssetMetadata, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XelisAssetMetadata &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ticker, ticker) || other.ticker == ticker) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.maxSupply, maxSupply) ||
                other.maxSupply == maxSupply) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, ticker, decimals, maxSupply, owner);

  @override
  String toString() {
    return 'XelisAssetMetadata(name: $name, ticker: $ticker, decimals: $decimals, maxSupply: $maxSupply, owner: $owner)';
  }
}

/// @nodoc
abstract mixin class $XelisAssetMetadataCopyWith<$Res> {
  factory $XelisAssetMetadataCopyWith(
          XelisAssetMetadata value, $Res Function(XelisAssetMetadata) _then) =
      _$XelisAssetMetadataCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String ticker,
      int decimals,
      XelisMaxSupplyMode maxSupply,
      XelisAssetOwner? owner});

  $XelisMaxSupplyModeCopyWith<$Res> get maxSupply;
  $XelisAssetOwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class _$XelisAssetMetadataCopyWithImpl<$Res>
    implements $XelisAssetMetadataCopyWith<$Res> {
  _$XelisAssetMetadataCopyWithImpl(this._self, this._then);

  final XelisAssetMetadata _self;
  final $Res Function(XelisAssetMetadata) _then;

  /// Create a copy of XelisAssetMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ticker = null,
    Object? decimals = null,
    Object? maxSupply = null,
    Object? owner = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _self.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      decimals: null == decimals
          ? _self.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      maxSupply: null == maxSupply
          ? _self.maxSupply
          : maxSupply // ignore: cast_nullable_to_non_nullable
              as XelisMaxSupplyMode,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as XelisAssetOwner?,
    ));
  }

  /// Create a copy of XelisAssetMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XelisMaxSupplyModeCopyWith<$Res> get maxSupply {
    return $XelisMaxSupplyModeCopyWith<$Res>(_self.maxSupply, (value) {
      return _then(_self.copyWith(maxSupply: value));
    });
  }

  /// Create a copy of XelisAssetMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XelisAssetOwnerCopyWith<$Res>? get owner {
    if (_self.owner == null) {
      return null;
    }

    return $XelisAssetOwnerCopyWith<$Res>(_self.owner!, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }
}

/// Adds pattern-matching-related methods to [XelisAssetMetadata].
extension XelisAssetMetadataPatterns on XelisAssetMetadata {
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
    TResult Function(_XelisAssetMetadata value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _XelisAssetMetadata() when $default != null:
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
    TResult Function(_XelisAssetMetadata value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XelisAssetMetadata():
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
    TResult? Function(_XelisAssetMetadata value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XelisAssetMetadata() when $default != null:
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
    TResult Function(String name, String ticker, int decimals,
            XelisMaxSupplyMode maxSupply, XelisAssetOwner? owner)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _XelisAssetMetadata() when $default != null:
        return $default(_that.name, _that.ticker, _that.decimals,
            _that.maxSupply, _that.owner);
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
    TResult Function(String name, String ticker, int decimals,
            XelisMaxSupplyMode maxSupply, XelisAssetOwner? owner)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XelisAssetMetadata():
        return $default(_that.name, _that.ticker, _that.decimals,
            _that.maxSupply, _that.owner);
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
    TResult? Function(String name, String ticker, int decimals,
            XelisMaxSupplyMode maxSupply, XelisAssetOwner? owner)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _XelisAssetMetadata() when $default != null:
        return $default(_that.name, _that.ticker, _that.decimals,
            _that.maxSupply, _that.owner);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _XelisAssetMetadata implements XelisAssetMetadata {
  const _XelisAssetMetadata(
      {required this.name,
      required this.ticker,
      required this.decimals,
      required this.maxSupply,
      this.owner});

  @override
  final String name;
  @override
  final String ticker;
  @override
  final int decimals;
  @override
  final XelisMaxSupplyMode maxSupply;
  @override
  final XelisAssetOwner? owner;

  /// Create a copy of XelisAssetMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$XelisAssetMetadataCopyWith<_XelisAssetMetadata> get copyWith =>
      __$XelisAssetMetadataCopyWithImpl<_XelisAssetMetadata>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _XelisAssetMetadata &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ticker, ticker) || other.ticker == ticker) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.maxSupply, maxSupply) ||
                other.maxSupply == maxSupply) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, ticker, decimals, maxSupply, owner);

  @override
  String toString() {
    return 'XelisAssetMetadata(name: $name, ticker: $ticker, decimals: $decimals, maxSupply: $maxSupply, owner: $owner)';
  }
}

/// @nodoc
abstract mixin class _$XelisAssetMetadataCopyWith<$Res>
    implements $XelisAssetMetadataCopyWith<$Res> {
  factory _$XelisAssetMetadataCopyWith(
          _XelisAssetMetadata value, $Res Function(_XelisAssetMetadata) _then) =
      __$XelisAssetMetadataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String ticker,
      int decimals,
      XelisMaxSupplyMode maxSupply,
      XelisAssetOwner? owner});

  @override
  $XelisMaxSupplyModeCopyWith<$Res> get maxSupply;
  @override
  $XelisAssetOwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class __$XelisAssetMetadataCopyWithImpl<$Res>
    implements _$XelisAssetMetadataCopyWith<$Res> {
  __$XelisAssetMetadataCopyWithImpl(this._self, this._then);

  final _XelisAssetMetadata _self;
  final $Res Function(_XelisAssetMetadata) _then;

  /// Create a copy of XelisAssetMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? ticker = null,
    Object? decimals = null,
    Object? maxSupply = null,
    Object? owner = freezed,
  }) {
    return _then(_XelisAssetMetadata(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _self.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      decimals: null == decimals
          ? _self.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      maxSupply: null == maxSupply
          ? _self.maxSupply
          : maxSupply // ignore: cast_nullable_to_non_nullable
              as XelisMaxSupplyMode,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as XelisAssetOwner?,
    ));
  }

  /// Create a copy of XelisAssetMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XelisMaxSupplyModeCopyWith<$Res> get maxSupply {
    return $XelisMaxSupplyModeCopyWith<$Res>(_self.maxSupply, (value) {
      return _then(_self.copyWith(maxSupply: value));
    });
  }

  /// Create a copy of XelisAssetMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $XelisAssetOwnerCopyWith<$Res>? get owner {
    if (_self.owner == null) {
      return null;
    }

    return $XelisAssetOwnerCopyWith<$Res>(_self.owner!, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }
}

/// @nodoc
mixin _$XelisAssetOwner {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is XelisAssetOwner);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'XelisAssetOwner()';
  }
}

/// @nodoc
class $XelisAssetOwnerCopyWith<$Res> {
  $XelisAssetOwnerCopyWith(
      XelisAssetOwner _, $Res Function(XelisAssetOwner) __);
}

/// Adds pattern-matching-related methods to [XelisAssetOwner].
extension XelisAssetOwnerPatterns on XelisAssetOwner {
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
    TResult Function(XelisAssetOwner_None value)? none,
    TResult Function(XelisAssetOwner_Creator value)? creator,
    TResult Function(XelisAssetOwner_Owner value)? owner,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case XelisAssetOwner_None() when none != null:
        return none(_that);
      case XelisAssetOwner_Creator() when creator != null:
        return creator(_that);
      case XelisAssetOwner_Owner() when owner != null:
        return owner(_that);
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
    required TResult Function(XelisAssetOwner_None value) none,
    required TResult Function(XelisAssetOwner_Creator value) creator,
    required TResult Function(XelisAssetOwner_Owner value) owner,
  }) {
    final _that = this;
    switch (_that) {
      case XelisAssetOwner_None():
        return none(_that);
      case XelisAssetOwner_Creator():
        return creator(_that);
      case XelisAssetOwner_Owner():
        return owner(_that);
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
    TResult? Function(XelisAssetOwner_None value)? none,
    TResult? Function(XelisAssetOwner_Creator value)? creator,
    TResult? Function(XelisAssetOwner_Owner value)? owner,
  }) {
    final _that = this;
    switch (_that) {
      case XelisAssetOwner_None() when none != null:
        return none(_that);
      case XelisAssetOwner_Creator() when creator != null:
        return creator(_that);
      case XelisAssetOwner_Owner() when owner != null:
        return owner(_that);
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
    TResult Function()? none,
    TResult Function(String contract, BigInt id)? creator,
    TResult Function(String origin, BigInt originId, String owner)? owner,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case XelisAssetOwner_None() when none != null:
        return none();
      case XelisAssetOwner_Creator() when creator != null:
        return creator(_that.contract, _that.id);
      case XelisAssetOwner_Owner() when owner != null:
        return owner(_that.origin, _that.originId, _that.owner);
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
    required TResult Function() none,
    required TResult Function(String contract, BigInt id) creator,
    required TResult Function(String origin, BigInt originId, String owner)
        owner,
  }) {
    final _that = this;
    switch (_that) {
      case XelisAssetOwner_None():
        return none();
      case XelisAssetOwner_Creator():
        return creator(_that.contract, _that.id);
      case XelisAssetOwner_Owner():
        return owner(_that.origin, _that.originId, _that.owner);
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
    TResult? Function()? none,
    TResult? Function(String contract, BigInt id)? creator,
    TResult? Function(String origin, BigInt originId, String owner)? owner,
  }) {
    final _that = this;
    switch (_that) {
      case XelisAssetOwner_None() when none != null:
        return none();
      case XelisAssetOwner_Creator() when creator != null:
        return creator(_that.contract, _that.id);
      case XelisAssetOwner_Owner() when owner != null:
        return owner(_that.origin, _that.originId, _that.owner);
      case _:
        return null;
    }
  }
}

/// @nodoc

class XelisAssetOwner_None extends XelisAssetOwner {
  const XelisAssetOwner_None() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is XelisAssetOwner_None);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'XelisAssetOwner.none()';
  }
}

/// @nodoc

class XelisAssetOwner_Creator extends XelisAssetOwner {
  const XelisAssetOwner_Creator({required this.contract, required this.id})
      : super._();

  final String contract;
  final BigInt id;

  /// Create a copy of XelisAssetOwner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $XelisAssetOwner_CreatorCopyWith<XelisAssetOwner_Creator> get copyWith =>
      _$XelisAssetOwner_CreatorCopyWithImpl<XelisAssetOwner_Creator>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XelisAssetOwner_Creator &&
            (identical(other.contract, contract) ||
                other.contract == contract) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contract, id);

  @override
  String toString() {
    return 'XelisAssetOwner.creator(contract: $contract, id: $id)';
  }
}

/// @nodoc
abstract mixin class $XelisAssetOwner_CreatorCopyWith<$Res>
    implements $XelisAssetOwnerCopyWith<$Res> {
  factory $XelisAssetOwner_CreatorCopyWith(XelisAssetOwner_Creator value,
          $Res Function(XelisAssetOwner_Creator) _then) =
      _$XelisAssetOwner_CreatorCopyWithImpl;
  @useResult
  $Res call({String contract, BigInt id});
}

/// @nodoc
class _$XelisAssetOwner_CreatorCopyWithImpl<$Res>
    implements $XelisAssetOwner_CreatorCopyWith<$Res> {
  _$XelisAssetOwner_CreatorCopyWithImpl(this._self, this._then);

  final XelisAssetOwner_Creator _self;
  final $Res Function(XelisAssetOwner_Creator) _then;

  /// Create a copy of XelisAssetOwner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? contract = null,
    Object? id = null,
  }) {
    return _then(XelisAssetOwner_Creator(
      contract: null == contract
          ? _self.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class XelisAssetOwner_Owner extends XelisAssetOwner {
  const XelisAssetOwner_Owner(
      {required this.origin, required this.originId, required this.owner})
      : super._();

  final String origin;
  final BigInt originId;
  final String owner;

  /// Create a copy of XelisAssetOwner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $XelisAssetOwner_OwnerCopyWith<XelisAssetOwner_Owner> get copyWith =>
      _$XelisAssetOwner_OwnerCopyWithImpl<XelisAssetOwner_Owner>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XelisAssetOwner_Owner &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.originId, originId) ||
                other.originId == originId) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @override
  int get hashCode => Object.hash(runtimeType, origin, originId, owner);

  @override
  String toString() {
    return 'XelisAssetOwner.owner(origin: $origin, originId: $originId, owner: $owner)';
  }
}

/// @nodoc
abstract mixin class $XelisAssetOwner_OwnerCopyWith<$Res>
    implements $XelisAssetOwnerCopyWith<$Res> {
  factory $XelisAssetOwner_OwnerCopyWith(XelisAssetOwner_Owner value,
          $Res Function(XelisAssetOwner_Owner) _then) =
      _$XelisAssetOwner_OwnerCopyWithImpl;
  @useResult
  $Res call({String origin, BigInt originId, String owner});
}

/// @nodoc
class _$XelisAssetOwner_OwnerCopyWithImpl<$Res>
    implements $XelisAssetOwner_OwnerCopyWith<$Res> {
  _$XelisAssetOwner_OwnerCopyWithImpl(this._self, this._then);

  final XelisAssetOwner_Owner _self;
  final $Res Function(XelisAssetOwner_Owner) _then;

  /// Create a copy of XelisAssetOwner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? origin = null,
    Object? originId = null,
    Object? owner = null,
  }) {
    return _then(XelisAssetOwner_Owner(
      origin: null == origin
          ? _self.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      originId: null == originId
          ? _self.originId
          : originId // ignore: cast_nullable_to_non_nullable
              as BigInt,
      owner: null == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$XelisMaxSupplyMode {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is XelisMaxSupplyMode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'XelisMaxSupplyMode()';
  }
}

/// @nodoc
class $XelisMaxSupplyModeCopyWith<$Res> {
  $XelisMaxSupplyModeCopyWith(
      XelisMaxSupplyMode _, $Res Function(XelisMaxSupplyMode) __);
}

/// Adds pattern-matching-related methods to [XelisMaxSupplyMode].
extension XelisMaxSupplyModePatterns on XelisMaxSupplyMode {
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
    TResult Function(XelisMaxSupplyMode_None value)? none,
    TResult Function(XelisMaxSupplyMode_Fixed value)? fixed,
    TResult Function(XelisMaxSupplyMode_Mintable value)? mintable,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case XelisMaxSupplyMode_None() when none != null:
        return none(_that);
      case XelisMaxSupplyMode_Fixed() when fixed != null:
        return fixed(_that);
      case XelisMaxSupplyMode_Mintable() when mintable != null:
        return mintable(_that);
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
    required TResult Function(XelisMaxSupplyMode_None value) none,
    required TResult Function(XelisMaxSupplyMode_Fixed value) fixed,
    required TResult Function(XelisMaxSupplyMode_Mintable value) mintable,
  }) {
    final _that = this;
    switch (_that) {
      case XelisMaxSupplyMode_None():
        return none(_that);
      case XelisMaxSupplyMode_Fixed():
        return fixed(_that);
      case XelisMaxSupplyMode_Mintable():
        return mintable(_that);
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
    TResult? Function(XelisMaxSupplyMode_None value)? none,
    TResult? Function(XelisMaxSupplyMode_Fixed value)? fixed,
    TResult? Function(XelisMaxSupplyMode_Mintable value)? mintable,
  }) {
    final _that = this;
    switch (_that) {
      case XelisMaxSupplyMode_None() when none != null:
        return none(_that);
      case XelisMaxSupplyMode_Fixed() when fixed != null:
        return fixed(_that);
      case XelisMaxSupplyMode_Mintable() when mintable != null:
        return mintable(_that);
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
    TResult Function()? none,
    TResult Function(BigInt field0)? fixed,
    TResult Function(BigInt field0)? mintable,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case XelisMaxSupplyMode_None() when none != null:
        return none();
      case XelisMaxSupplyMode_Fixed() when fixed != null:
        return fixed(_that.field0);
      case XelisMaxSupplyMode_Mintable() when mintable != null:
        return mintable(_that.field0);
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
    required TResult Function() none,
    required TResult Function(BigInt field0) fixed,
    required TResult Function(BigInt field0) mintable,
  }) {
    final _that = this;
    switch (_that) {
      case XelisMaxSupplyMode_None():
        return none();
      case XelisMaxSupplyMode_Fixed():
        return fixed(_that.field0);
      case XelisMaxSupplyMode_Mintable():
        return mintable(_that.field0);
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
    TResult? Function()? none,
    TResult? Function(BigInt field0)? fixed,
    TResult? Function(BigInt field0)? mintable,
  }) {
    final _that = this;
    switch (_that) {
      case XelisMaxSupplyMode_None() when none != null:
        return none();
      case XelisMaxSupplyMode_Fixed() when fixed != null:
        return fixed(_that.field0);
      case XelisMaxSupplyMode_Mintable() when mintable != null:
        return mintable(_that.field0);
      case _:
        return null;
    }
  }
}

/// @nodoc

class XelisMaxSupplyMode_None extends XelisMaxSupplyMode {
  const XelisMaxSupplyMode_None() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is XelisMaxSupplyMode_None);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'XelisMaxSupplyMode.none()';
  }
}

/// @nodoc

class XelisMaxSupplyMode_Fixed extends XelisMaxSupplyMode {
  const XelisMaxSupplyMode_Fixed(this.field0) : super._();

  final BigInt field0;

  /// Create a copy of XelisMaxSupplyMode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $XelisMaxSupplyMode_FixedCopyWith<XelisMaxSupplyMode_Fixed> get copyWith =>
      _$XelisMaxSupplyMode_FixedCopyWithImpl<XelisMaxSupplyMode_Fixed>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XelisMaxSupplyMode_Fixed &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'XelisMaxSupplyMode.fixed(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $XelisMaxSupplyMode_FixedCopyWith<$Res>
    implements $XelisMaxSupplyModeCopyWith<$Res> {
  factory $XelisMaxSupplyMode_FixedCopyWith(XelisMaxSupplyMode_Fixed value,
          $Res Function(XelisMaxSupplyMode_Fixed) _then) =
      _$XelisMaxSupplyMode_FixedCopyWithImpl;
  @useResult
  $Res call({BigInt field0});
}

/// @nodoc
class _$XelisMaxSupplyMode_FixedCopyWithImpl<$Res>
    implements $XelisMaxSupplyMode_FixedCopyWith<$Res> {
  _$XelisMaxSupplyMode_FixedCopyWithImpl(this._self, this._then);

  final XelisMaxSupplyMode_Fixed _self;
  final $Res Function(XelisMaxSupplyMode_Fixed) _then;

  /// Create a copy of XelisMaxSupplyMode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(XelisMaxSupplyMode_Fixed(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class XelisMaxSupplyMode_Mintable extends XelisMaxSupplyMode {
  const XelisMaxSupplyMode_Mintable(this.field0) : super._();

  final BigInt field0;

  /// Create a copy of XelisMaxSupplyMode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $XelisMaxSupplyMode_MintableCopyWith<XelisMaxSupplyMode_Mintable>
      get copyWith => _$XelisMaxSupplyMode_MintableCopyWithImpl<
          XelisMaxSupplyMode_Mintable>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XelisMaxSupplyMode_Mintable &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'XelisMaxSupplyMode.mintable(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $XelisMaxSupplyMode_MintableCopyWith<$Res>
    implements $XelisMaxSupplyModeCopyWith<$Res> {
  factory $XelisMaxSupplyMode_MintableCopyWith(
          XelisMaxSupplyMode_Mintable value,
          $Res Function(XelisMaxSupplyMode_Mintable) _then) =
      _$XelisMaxSupplyMode_MintableCopyWithImpl;
  @useResult
  $Res call({BigInt field0});
}

/// @nodoc
class _$XelisMaxSupplyMode_MintableCopyWithImpl<$Res>
    implements $XelisMaxSupplyMode_MintableCopyWith<$Res> {
  _$XelisMaxSupplyMode_MintableCopyWithImpl(this._self, this._then);

  final XelisMaxSupplyMode_Mintable _self;
  final $Res Function(XelisMaxSupplyMode_Mintable) _then;

  /// Create a copy of XelisMaxSupplyMode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(XelisMaxSupplyMode_Mintable(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

// dart format on
