import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure implements Exception {
  // 網路相關錯誤
  const factory Failure.network({
    @Default('網路連線不穩定，請稍後再試') String message,
    Object? originalError,
  }) = NetworkFailure;

  // Sidecar 服務錯誤 (gRPC 等)
  const factory Failure.sidecar({
    @Default('Sidecar 服務異常') String message,
    Object? originalError,
  }) = SidecarFailure;

  // 擴充功能相關錯誤
  const factory Failure.extension({
    @Default('擴充功能執行出錯') String message,
    String? pkgName,
    Object? originalError,
  }) = ExtensionFailure;

  // 內容解析錯誤 (如 Forum API 變動)
  const factory Failure.parser({
    @Default('內容解析失敗，論壇可能已變更介面') String message,
    Object? originalError,
  }) = ParserFailure;

  // 未預期的本地錯誤
  const factory Failure.unexpected({
    @Default('發生未預期的錯誤') String message,
    Object? originalError,
  }) = UnexpectedFailure;

  // 封裝原始錯誤的 helper
  static Failure fromError(Object error) {
    if (error is Failure) return error;

    final errorStr = error.toString().toLowerCase();

    if (errorStr.contains('socketexception') ||
        errorStr.contains('httpexception') ||
        errorStr.contains('connection failed')) {
      return Failure.network(originalError: error);
    }

    if (errorStr.contains('grpc') || errorStr.contains('sidecar')) {
      return Failure.sidecar(originalError: error);
    }

    return Failure.unexpected(originalError: error, message: error.toString());
  }
}
