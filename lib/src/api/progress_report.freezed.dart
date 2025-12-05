// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Report {
  String? get message;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportCopyWith<Report> get copyWith =>
      _$ReportCopyWithImpl<Report>(this as Report, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Report &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Report(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) _then) =
      _$ReportCopyWithImpl;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$ReportCopyWithImpl<$Res> implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._self, this._then);

  final Report _self;
  final $Res Function(Report) _then;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class Report_TableGeneration extends Report {
  const Report_TableGeneration(
      {required this.progress, required this.step, this.message})
      : super._();

  final double progress;
  final String step;
  @override
  final String? message;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Report_TableGenerationCopyWith<Report_TableGeneration> get copyWith =>
      _$Report_TableGenerationCopyWithImpl<Report_TableGeneration>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Report_TableGeneration &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress, step, message);

  @override
  String toString() {
    return 'Report.tableGeneration(progress: $progress, step: $step, message: $message)';
  }
}

/// @nodoc
abstract mixin class $Report_TableGenerationCopyWith<$Res>
    implements $ReportCopyWith<$Res> {
  factory $Report_TableGenerationCopyWith(Report_TableGeneration value,
          $Res Function(Report_TableGeneration) _then) =
      _$Report_TableGenerationCopyWithImpl;
  @override
  @useResult
  $Res call({double progress, String step, String? message});
}

/// @nodoc
class _$Report_TableGenerationCopyWithImpl<$Res>
    implements $Report_TableGenerationCopyWith<$Res> {
  _$Report_TableGenerationCopyWithImpl(this._self, this._then);

  final Report_TableGeneration _self;
  final $Res Function(Report_TableGeneration) _then;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? progress = null,
    Object? step = null,
    Object? message = freezed,
  }) {
    return _then(Report_TableGeneration(
      progress: null == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      step: null == step
          ? _self.step
          : step // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class Report_Misc extends Report {
  const Report_Misc({this.message}) : super._();

  @override
  final String? message;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Report_MiscCopyWith<Report_Misc> get copyWith =>
      _$Report_MiscCopyWithImpl<Report_Misc>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Report_Misc &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Report.misc(message: $message)';
  }
}

/// @nodoc
abstract mixin class $Report_MiscCopyWith<$Res>
    implements $ReportCopyWith<$Res> {
  factory $Report_MiscCopyWith(
          Report_Misc value, $Res Function(Report_Misc) _then) =
      _$Report_MiscCopyWithImpl;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$Report_MiscCopyWithImpl<$Res> implements $Report_MiscCopyWith<$Res> {
  _$Report_MiscCopyWithImpl(this._self, this._then);

  final Report_Misc _self;
  final $Res Function(Report_Misc) _then;

  /// Create a copy of Report
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(Report_Misc(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
