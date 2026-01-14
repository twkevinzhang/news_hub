// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  Object? get originalError => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, Object? originalError) network,
    required TResult Function(String message, Object? originalError) sidecar,
    required TResult Function(
      String message,
      String? pkgName,
      Object? originalError,
    )
    extension,
    required TResult Function(String message, Object? originalError) parser,
    required TResult Function(String message, Object? originalError) unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Object? originalError)? network,
    TResult? Function(String message, Object? originalError)? sidecar,
    TResult? Function(String message, String? pkgName, Object? originalError)?
    extension,
    TResult? Function(String message, Object? originalError)? parser,
    TResult? Function(String message, Object? originalError)? unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Object? originalError)? network,
    TResult Function(String message, Object? originalError)? sidecar,
    TResult Function(String message, String? pkgName, Object? originalError)?
    extension,
    TResult Function(String message, Object? originalError)? parser,
    TResult Function(String message, Object? originalError)? unexpected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(SidecarFailure value) sidecar,
    required TResult Function(ExtensionFailure value) extension,
    required TResult Function(ParserFailure value) parser,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(SidecarFailure value)? sidecar,
    TResult? Function(ExtensionFailure value)? extension,
    TResult? Function(ParserFailure value)? parser,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(SidecarFailure value)? sidecar,
    TResult Function(ExtensionFailure value)? extension,
    TResult Function(ParserFailure value)? parser,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message, Object? originalError});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? originalError = freezed}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            originalError: freezed == originalError
                ? _value.originalError
                : originalError,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(
    _$NetworkFailureImpl value,
    $Res Function(_$NetworkFailureImpl) then,
  ) = __$$NetworkFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Object? originalError});
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
    _$NetworkFailureImpl _value,
    $Res Function(_$NetworkFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? originalError = freezed}) {
    return _then(
      _$NetworkFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        originalError: freezed == originalError
            ? _value.originalError
            : originalError,
      ),
    );
  }
}

/// @nodoc

class _$NetworkFailureImpl implements NetworkFailure {
  const _$NetworkFailureImpl({
    this.message = '網路連線不穩定，請稍後再試',
    this.originalError,
  });

  @override
  @JsonKey()
  final String message;
  @override
  final Object? originalError;

  @override
  String toString() {
    return 'Failure.network(message: $message, originalError: $originalError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other.originalError,
              originalError,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(originalError),
  );

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      __$$NetworkFailureImplCopyWithImpl<_$NetworkFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, Object? originalError) network,
    required TResult Function(String message, Object? originalError) sidecar,
    required TResult Function(
      String message,
      String? pkgName,
      Object? originalError,
    )
    extension,
    required TResult Function(String message, Object? originalError) parser,
    required TResult Function(String message, Object? originalError) unexpected,
  }) {
    return network(message, originalError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Object? originalError)? network,
    TResult? Function(String message, Object? originalError)? sidecar,
    TResult? Function(String message, String? pkgName, Object? originalError)?
    extension,
    TResult? Function(String message, Object? originalError)? parser,
    TResult? Function(String message, Object? originalError)? unexpected,
  }) {
    return network?.call(message, originalError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Object? originalError)? network,
    TResult Function(String message, Object? originalError)? sidecar,
    TResult Function(String message, String? pkgName, Object? originalError)?
    extension,
    TResult Function(String message, Object? originalError)? parser,
    TResult Function(String message, Object? originalError)? unexpected,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message, originalError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(SidecarFailure value) sidecar,
    required TResult Function(ExtensionFailure value) extension,
    required TResult Function(ParserFailure value) parser,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(SidecarFailure value)? sidecar,
    TResult? Function(ExtensionFailure value)? extension,
    TResult? Function(ParserFailure value)? parser,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(SidecarFailure value)? sidecar,
    TResult Function(ExtensionFailure value)? extension,
    TResult Function(ParserFailure value)? parser,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure implements Failure {
  const factory NetworkFailure({
    final String message,
    final Object? originalError,
  }) = _$NetworkFailureImpl;

  @override
  String get message;
  @override
  Object? get originalError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SidecarFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$SidecarFailureImplCopyWith(
    _$SidecarFailureImpl value,
    $Res Function(_$SidecarFailureImpl) then,
  ) = __$$SidecarFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Object? originalError});
}

/// @nodoc
class __$$SidecarFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$SidecarFailureImpl>
    implements _$$SidecarFailureImplCopyWith<$Res> {
  __$$SidecarFailureImplCopyWithImpl(
    _$SidecarFailureImpl _value,
    $Res Function(_$SidecarFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? originalError = freezed}) {
    return _then(
      _$SidecarFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        originalError: freezed == originalError
            ? _value.originalError
            : originalError,
      ),
    );
  }
}

/// @nodoc

class _$SidecarFailureImpl implements SidecarFailure {
  const _$SidecarFailureImpl({
    this.message = 'Sidecar 服務異常',
    this.originalError,
  });

  @override
  @JsonKey()
  final String message;
  @override
  final Object? originalError;

  @override
  String toString() {
    return 'Failure.sidecar(message: $message, originalError: $originalError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SidecarFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other.originalError,
              originalError,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(originalError),
  );

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SidecarFailureImplCopyWith<_$SidecarFailureImpl> get copyWith =>
      __$$SidecarFailureImplCopyWithImpl<_$SidecarFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, Object? originalError) network,
    required TResult Function(String message, Object? originalError) sidecar,
    required TResult Function(
      String message,
      String? pkgName,
      Object? originalError,
    )
    extension,
    required TResult Function(String message, Object? originalError) parser,
    required TResult Function(String message, Object? originalError) unexpected,
  }) {
    return sidecar(message, originalError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Object? originalError)? network,
    TResult? Function(String message, Object? originalError)? sidecar,
    TResult? Function(String message, String? pkgName, Object? originalError)?
    extension,
    TResult? Function(String message, Object? originalError)? parser,
    TResult? Function(String message, Object? originalError)? unexpected,
  }) {
    return sidecar?.call(message, originalError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Object? originalError)? network,
    TResult Function(String message, Object? originalError)? sidecar,
    TResult Function(String message, String? pkgName, Object? originalError)?
    extension,
    TResult Function(String message, Object? originalError)? parser,
    TResult Function(String message, Object? originalError)? unexpected,
    required TResult orElse(),
  }) {
    if (sidecar != null) {
      return sidecar(message, originalError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(SidecarFailure value) sidecar,
    required TResult Function(ExtensionFailure value) extension,
    required TResult Function(ParserFailure value) parser,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return sidecar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(SidecarFailure value)? sidecar,
    TResult? Function(ExtensionFailure value)? extension,
    TResult? Function(ParserFailure value)? parser,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return sidecar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(SidecarFailure value)? sidecar,
    TResult Function(ExtensionFailure value)? extension,
    TResult Function(ParserFailure value)? parser,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (sidecar != null) {
      return sidecar(this);
    }
    return orElse();
  }
}

abstract class SidecarFailure implements Failure {
  const factory SidecarFailure({
    final String message,
    final Object? originalError,
  }) = _$SidecarFailureImpl;

  @override
  String get message;
  @override
  Object? get originalError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SidecarFailureImplCopyWith<_$SidecarFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExtensionFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ExtensionFailureImplCopyWith(
    _$ExtensionFailureImpl value,
    $Res Function(_$ExtensionFailureImpl) then,
  ) = __$$ExtensionFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? pkgName, Object? originalError});
}

/// @nodoc
class __$$ExtensionFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ExtensionFailureImpl>
    implements _$$ExtensionFailureImplCopyWith<$Res> {
  __$$ExtensionFailureImplCopyWithImpl(
    _$ExtensionFailureImpl _value,
    $Res Function(_$ExtensionFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? pkgName = freezed,
    Object? originalError = freezed,
  }) {
    return _then(
      _$ExtensionFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        pkgName: freezed == pkgName
            ? _value.pkgName
            : pkgName // ignore: cast_nullable_to_non_nullable
                  as String?,
        originalError: freezed == originalError
            ? _value.originalError
            : originalError,
      ),
    );
  }
}

/// @nodoc

class _$ExtensionFailureImpl implements ExtensionFailure {
  const _$ExtensionFailureImpl({
    this.message = '擴充功能執行出錯',
    this.pkgName,
    this.originalError,
  });

  @override
  @JsonKey()
  final String message;
  @override
  final String? pkgName;
  @override
  final Object? originalError;

  @override
  String toString() {
    return 'Failure.extension(message: $message, pkgName: $pkgName, originalError: $originalError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.pkgName, pkgName) || other.pkgName == pkgName) &&
            const DeepCollectionEquality().equals(
              other.originalError,
              originalError,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    pkgName,
    const DeepCollectionEquality().hash(originalError),
  );

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionFailureImplCopyWith<_$ExtensionFailureImpl> get copyWith =>
      __$$ExtensionFailureImplCopyWithImpl<_$ExtensionFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, Object? originalError) network,
    required TResult Function(String message, Object? originalError) sidecar,
    required TResult Function(
      String message,
      String? pkgName,
      Object? originalError,
    )
    extension,
    required TResult Function(String message, Object? originalError) parser,
    required TResult Function(String message, Object? originalError) unexpected,
  }) {
    return extension(message, pkgName, originalError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Object? originalError)? network,
    TResult? Function(String message, Object? originalError)? sidecar,
    TResult? Function(String message, String? pkgName, Object? originalError)?
    extension,
    TResult? Function(String message, Object? originalError)? parser,
    TResult? Function(String message, Object? originalError)? unexpected,
  }) {
    return extension?.call(message, pkgName, originalError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Object? originalError)? network,
    TResult Function(String message, Object? originalError)? sidecar,
    TResult Function(String message, String? pkgName, Object? originalError)?
    extension,
    TResult Function(String message, Object? originalError)? parser,
    TResult Function(String message, Object? originalError)? unexpected,
    required TResult orElse(),
  }) {
    if (extension != null) {
      return extension(message, pkgName, originalError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(SidecarFailure value) sidecar,
    required TResult Function(ExtensionFailure value) extension,
    required TResult Function(ParserFailure value) parser,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return extension(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(SidecarFailure value)? sidecar,
    TResult? Function(ExtensionFailure value)? extension,
    TResult? Function(ParserFailure value)? parser,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return extension?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(SidecarFailure value)? sidecar,
    TResult Function(ExtensionFailure value)? extension,
    TResult Function(ParserFailure value)? parser,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (extension != null) {
      return extension(this);
    }
    return orElse();
  }
}

abstract class ExtensionFailure implements Failure {
  const factory ExtensionFailure({
    final String message,
    final String? pkgName,
    final Object? originalError,
  }) = _$ExtensionFailureImpl;

  @override
  String get message;
  String? get pkgName;
  @override
  Object? get originalError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionFailureImplCopyWith<_$ExtensionFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParserFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ParserFailureImplCopyWith(
    _$ParserFailureImpl value,
    $Res Function(_$ParserFailureImpl) then,
  ) = __$$ParserFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Object? originalError});
}

/// @nodoc
class __$$ParserFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ParserFailureImpl>
    implements _$$ParserFailureImplCopyWith<$Res> {
  __$$ParserFailureImplCopyWithImpl(
    _$ParserFailureImpl _value,
    $Res Function(_$ParserFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? originalError = freezed}) {
    return _then(
      _$ParserFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        originalError: freezed == originalError
            ? _value.originalError
            : originalError,
      ),
    );
  }
}

/// @nodoc

class _$ParserFailureImpl implements ParserFailure {
  const _$ParserFailureImpl({
    this.message = '內容解析失敗，論壇可能已變更介面',
    this.originalError,
  });

  @override
  @JsonKey()
  final String message;
  @override
  final Object? originalError;

  @override
  String toString() {
    return 'Failure.parser(message: $message, originalError: $originalError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParserFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other.originalError,
              originalError,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(originalError),
  );

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParserFailureImplCopyWith<_$ParserFailureImpl> get copyWith =>
      __$$ParserFailureImplCopyWithImpl<_$ParserFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, Object? originalError) network,
    required TResult Function(String message, Object? originalError) sidecar,
    required TResult Function(
      String message,
      String? pkgName,
      Object? originalError,
    )
    extension,
    required TResult Function(String message, Object? originalError) parser,
    required TResult Function(String message, Object? originalError) unexpected,
  }) {
    return parser(message, originalError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Object? originalError)? network,
    TResult? Function(String message, Object? originalError)? sidecar,
    TResult? Function(String message, String? pkgName, Object? originalError)?
    extension,
    TResult? Function(String message, Object? originalError)? parser,
    TResult? Function(String message, Object? originalError)? unexpected,
  }) {
    return parser?.call(message, originalError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Object? originalError)? network,
    TResult Function(String message, Object? originalError)? sidecar,
    TResult Function(String message, String? pkgName, Object? originalError)?
    extension,
    TResult Function(String message, Object? originalError)? parser,
    TResult Function(String message, Object? originalError)? unexpected,
    required TResult orElse(),
  }) {
    if (parser != null) {
      return parser(message, originalError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(SidecarFailure value) sidecar,
    required TResult Function(ExtensionFailure value) extension,
    required TResult Function(ParserFailure value) parser,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return parser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(SidecarFailure value)? sidecar,
    TResult? Function(ExtensionFailure value)? extension,
    TResult? Function(ParserFailure value)? parser,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return parser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(SidecarFailure value)? sidecar,
    TResult Function(ExtensionFailure value)? extension,
    TResult Function(ParserFailure value)? parser,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (parser != null) {
      return parser(this);
    }
    return orElse();
  }
}

abstract class ParserFailure implements Failure {
  const factory ParserFailure({
    final String message,
    final Object? originalError,
  }) = _$ParserFailureImpl;

  @override
  String get message;
  @override
  Object? get originalError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParserFailureImplCopyWith<_$ParserFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnexpectedFailureImplCopyWith(
    _$UnexpectedFailureImpl value,
    $Res Function(_$UnexpectedFailureImpl) then,
  ) = __$$UnexpectedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Object? originalError});
}

/// @nodoc
class __$$UnexpectedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnexpectedFailureImpl>
    implements _$$UnexpectedFailureImplCopyWith<$Res> {
  __$$UnexpectedFailureImplCopyWithImpl(
    _$UnexpectedFailureImpl _value,
    $Res Function(_$UnexpectedFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? originalError = freezed}) {
    return _then(
      _$UnexpectedFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        originalError: freezed == originalError
            ? _value.originalError
            : originalError,
      ),
    );
  }
}

/// @nodoc

class _$UnexpectedFailureImpl implements UnexpectedFailure {
  const _$UnexpectedFailureImpl({
    this.message = '發生未預期的錯誤',
    this.originalError,
  });

  @override
  @JsonKey()
  final String message;
  @override
  final Object? originalError;

  @override
  String toString() {
    return 'Failure.unexpected(message: $message, originalError: $originalError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other.originalError,
              originalError,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(originalError),
  );

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      __$$UnexpectedFailureImplCopyWithImpl<_$UnexpectedFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, Object? originalError) network,
    required TResult Function(String message, Object? originalError) sidecar,
    required TResult Function(
      String message,
      String? pkgName,
      Object? originalError,
    )
    extension,
    required TResult Function(String message, Object? originalError) parser,
    required TResult Function(String message, Object? originalError) unexpected,
  }) {
    return unexpected(message, originalError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Object? originalError)? network,
    TResult? Function(String message, Object? originalError)? sidecar,
    TResult? Function(String message, String? pkgName, Object? originalError)?
    extension,
    TResult? Function(String message, Object? originalError)? parser,
    TResult? Function(String message, Object? originalError)? unexpected,
  }) {
    return unexpected?.call(message, originalError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Object? originalError)? network,
    TResult Function(String message, Object? originalError)? sidecar,
    TResult Function(String message, String? pkgName, Object? originalError)?
    extension,
    TResult Function(String message, Object? originalError)? parser,
    TResult Function(String message, Object? originalError)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(message, originalError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(SidecarFailure value) sidecar,
    required TResult Function(ExtensionFailure value) extension,
    required TResult Function(ParserFailure value) parser,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(SidecarFailure value)? sidecar,
    TResult? Function(ExtensionFailure value)? extension,
    TResult? Function(ParserFailure value)? parser,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(SidecarFailure value)? sidecar,
    TResult Function(ExtensionFailure value)? extension,
    TResult Function(ParserFailure value)? parser,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class UnexpectedFailure implements Failure {
  const factory UnexpectedFailure({
    final String message,
    final Object? originalError,
  }) = _$UnexpectedFailureImpl;

  @override
  String get message;
  @override
  Object? get originalError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
