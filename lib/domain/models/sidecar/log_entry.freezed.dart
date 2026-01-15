// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LogEntry {
  DateTime get timestamp => throw _privateConstructorUsedError;
  LogLevel get level => throw _privateConstructorUsedError;
  String get loggerName => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get exception => throw _privateConstructorUsedError;

  /// Create a copy of LogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogEntryCopyWith<LogEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogEntryCopyWith<$Res> {
  factory $LogEntryCopyWith(LogEntry value, $Res Function(LogEntry) then) =
      _$LogEntryCopyWithImpl<$Res, LogEntry>;
  @useResult
  $Res call({
    DateTime timestamp,
    LogLevel level,
    String loggerName,
    String message,
    String exception,
  });
}

/// @nodoc
class _$LogEntryCopyWithImpl<$Res, $Val extends LogEntry>
    implements $LogEntryCopyWith<$Res> {
  _$LogEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? level = null,
    Object? loggerName = null,
    Object? message = null,
    Object? exception = null,
  }) {
    return _then(
      _value.copyWith(
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as LogLevel,
            loggerName: null == loggerName
                ? _value.loggerName
                : loggerName // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            exception: null == exception
                ? _value.exception
                : exception // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LogEntryImplCopyWith<$Res>
    implements $LogEntryCopyWith<$Res> {
  factory _$$LogEntryImplCopyWith(
    _$LogEntryImpl value,
    $Res Function(_$LogEntryImpl) then,
  ) = __$$LogEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime timestamp,
    LogLevel level,
    String loggerName,
    String message,
    String exception,
  });
}

/// @nodoc
class __$$LogEntryImplCopyWithImpl<$Res>
    extends _$LogEntryCopyWithImpl<$Res, _$LogEntryImpl>
    implements _$$LogEntryImplCopyWith<$Res> {
  __$$LogEntryImplCopyWithImpl(
    _$LogEntryImpl _value,
    $Res Function(_$LogEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? level = null,
    Object? loggerName = null,
    Object? message = null,
    Object? exception = null,
  }) {
    return _then(
      _$LogEntryImpl(
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as LogLevel,
        loggerName: null == loggerName
            ? _value.loggerName
            : loggerName // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        exception: null == exception
            ? _value.exception
            : exception // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LogEntryImpl implements _LogEntry {
  const _$LogEntryImpl({
    required this.timestamp,
    required this.level,
    required this.loggerName,
    required this.message,
    required this.exception,
  });

  @override
  final DateTime timestamp;
  @override
  final LogLevel level;
  @override
  final String loggerName;
  @override
  final String message;
  @override
  final String exception;

  @override
  String toString() {
    return 'LogEntry(timestamp: $timestamp, level: $level, loggerName: $loggerName, message: $message, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogEntryImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.loggerName, loggerName) ||
                other.loggerName == loggerName) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    timestamp,
    level,
    loggerName,
    message,
    exception,
  );

  /// Create a copy of LogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogEntryImplCopyWith<_$LogEntryImpl> get copyWith =>
      __$$LogEntryImplCopyWithImpl<_$LogEntryImpl>(this, _$identity);
}

abstract class _LogEntry implements LogEntry {
  const factory _LogEntry({
    required final DateTime timestamp,
    required final LogLevel level,
    required final String loggerName,
    required final String message,
    required final String exception,
  }) = _$LogEntryImpl;

  @override
  DateTime get timestamp;
  @override
  LogLevel get level;
  @override
  String get loggerName;
  @override
  String get message;
  @override
  String get exception;

  /// Create a copy of LogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogEntryImplCopyWith<_$LogEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
