// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sidecar_logs_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SidecarLogsState {
  /// 所有日誌條目（未過濾）
  List<LogEntry> get logs => throw _privateConstructorUsedError;

  /// 搜尋查詢字串
  String get searchQuery => throw _privateConstructorUsedError;

  /// 是否正在搜尋模式
  bool get isSearching => throw _privateConstructorUsedError;

  /// 匯出是否成功
  bool get exportSuccess => throw _privateConstructorUsedError;

  /// 匯出的檔案路徑
  String? get exportPath => throw _privateConstructorUsedError;

  /// 錯誤訊息
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of SidecarLogsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SidecarLogsStateCopyWith<SidecarLogsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SidecarLogsStateCopyWith<$Res> {
  factory $SidecarLogsStateCopyWith(
          SidecarLogsState value, $Res Function(SidecarLogsState) then) =
      _$SidecarLogsStateCopyWithImpl<$Res, SidecarLogsState>;
  @useResult
  $Res call(
      {List<LogEntry> logs,
      String searchQuery,
      bool isSearching,
      bool exportSuccess,
      String? exportPath,
      String? error});
}

/// @nodoc
class _$SidecarLogsStateCopyWithImpl<$Res, $Val extends SidecarLogsState>
    implements $SidecarLogsStateCopyWith<$Res> {
  _$SidecarLogsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SidecarLogsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
    Object? searchQuery = null,
    Object? isSearching = null,
    Object? exportSuccess = null,
    Object? exportPath = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<LogEntry>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      exportSuccess: null == exportSuccess
          ? _value.exportSuccess
          : exportSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      exportPath: freezed == exportPath
          ? _value.exportPath
          : exportPath // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SidecarLogsStateImplCopyWith<$Res>
    implements $SidecarLogsStateCopyWith<$Res> {
  factory _$$SidecarLogsStateImplCopyWith(_$SidecarLogsStateImpl value,
          $Res Function(_$SidecarLogsStateImpl) then) =
      __$$SidecarLogsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LogEntry> logs,
      String searchQuery,
      bool isSearching,
      bool exportSuccess,
      String? exportPath,
      String? error});
}

/// @nodoc
class __$$SidecarLogsStateImplCopyWithImpl<$Res>
    extends _$SidecarLogsStateCopyWithImpl<$Res, _$SidecarLogsStateImpl>
    implements _$$SidecarLogsStateImplCopyWith<$Res> {
  __$$SidecarLogsStateImplCopyWithImpl(_$SidecarLogsStateImpl _value,
      $Res Function(_$SidecarLogsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SidecarLogsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
    Object? searchQuery = null,
    Object? isSearching = null,
    Object? exportSuccess = null,
    Object? exportPath = freezed,
    Object? error = freezed,
  }) {
    return _then(_$SidecarLogsStateImpl(
      logs: null == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<LogEntry>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      exportSuccess: null == exportSuccess
          ? _value.exportSuccess
          : exportSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      exportPath: freezed == exportPath
          ? _value.exportPath
          : exportPath // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SidecarLogsStateImpl extends _SidecarLogsState {
  const _$SidecarLogsStateImpl(
      {final List<LogEntry> logs = const [],
      this.searchQuery = '',
      this.isSearching = false,
      this.exportSuccess = false,
      this.exportPath,
      this.error})
      : _logs = logs,
        super._();

  /// 所有日誌條目（未過濾）
  final List<LogEntry> _logs;

  /// 所有日誌條目（未過濾）
  @override
  @JsonKey()
  List<LogEntry> get logs {
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logs);
  }

  /// 搜尋查詢字串
  @override
  @JsonKey()
  final String searchQuery;

  /// 是否正在搜尋模式
  @override
  @JsonKey()
  final bool isSearching;

  /// 匯出是否成功
  @override
  @JsonKey()
  final bool exportSuccess;

  /// 匯出的檔案路徑
  @override
  final String? exportPath;

  /// 錯誤訊息
  @override
  final String? error;

  @override
  String toString() {
    return 'SidecarLogsState(logs: $logs, searchQuery: $searchQuery, isSearching: $isSearching, exportSuccess: $exportSuccess, exportPath: $exportPath, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SidecarLogsStateImpl &&
            const DeepCollectionEquality().equals(other._logs, _logs) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.exportSuccess, exportSuccess) ||
                other.exportSuccess == exportSuccess) &&
            (identical(other.exportPath, exportPath) ||
                other.exportPath == exportPath) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_logs),
      searchQuery,
      isSearching,
      exportSuccess,
      exportPath,
      error);

  /// Create a copy of SidecarLogsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SidecarLogsStateImplCopyWith<_$SidecarLogsStateImpl> get copyWith =>
      __$$SidecarLogsStateImplCopyWithImpl<_$SidecarLogsStateImpl>(
          this, _$identity);
}

abstract class _SidecarLogsState extends SidecarLogsState {
  const factory _SidecarLogsState(
      {final List<LogEntry> logs,
      final String searchQuery,
      final bool isSearching,
      final bool exportSuccess,
      final String? exportPath,
      final String? error}) = _$SidecarLogsStateImpl;
  const _SidecarLogsState._() : super._();

  /// 所有日誌條目（未過濾）
  @override
  List<LogEntry> get logs;

  /// 搜尋查詢字串
  @override
  String get searchQuery;

  /// 是否正在搜尋模式
  @override
  bool get isSearching;

  /// 匯出是否成功
  @override
  bool get exportSuccess;

  /// 匯出的檔案路徑
  @override
  String? get exportPath;

  /// 錯誤訊息
  @override
  String? get error;

  /// Create a copy of SidecarLogsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SidecarLogsStateImplCopyWith<_$SidecarLogsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
