//
//  Generated code. Do not modify.
//  source: sidecar_api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ParagraphType extends $pb.ProtobufEnum {
  static const ParagraphType PARAGRAPH_TYPE_UNSPECIFIED = ParagraphType._(0, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_UNSPECIFIED');
  static const ParagraphType PARAGRAPH_TYPE_QUOTE = ParagraphType._(1, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_QUOTE');
  static const ParagraphType PARAGRAPH_TYPE_REPLY_TO = ParagraphType._(2, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_REPLY_TO');
  static const ParagraphType PARAGRAPH_TYPE_TEXT = ParagraphType._(3, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_TEXT');
  static const ParagraphType PARAGRAPH_TYPE_NEW_LINE = ParagraphType._(7, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_NEW_LINE');
  static const ParagraphType PARAGRAPH_TYPE_IMAGE = ParagraphType._(4, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_IMAGE');
  static const ParagraphType PARAGRAPH_TYPE_LINK = ParagraphType._(5, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_LINK');
  static const ParagraphType PARAGRAPH_TYPE_VIDEO = ParagraphType._(6, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_VIDEO');

  static const $core.List<ParagraphType> values = <ParagraphType> [
    PARAGRAPH_TYPE_UNSPECIFIED,
    PARAGRAPH_TYPE_QUOTE,
    PARAGRAPH_TYPE_REPLY_TO,
    PARAGRAPH_TYPE_TEXT,
    PARAGRAPH_TYPE_NEW_LINE,
    PARAGRAPH_TYPE_IMAGE,
    PARAGRAPH_TYPE_LINK,
    PARAGRAPH_TYPE_VIDEO,
  ];

  static final $core.Map<$core.int, ParagraphType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ParagraphType? valueOf($core.int value) => _byValue[value];

  const ParagraphType._($core.int v, $core.String n) : super(v, n);
}

/// Logs messages
class LogLevel extends $pb.ProtobufEnum {
  static const LogLevel DEBUG = LogLevel._(0, _omitEnumNames ? '' : 'DEBUG');
  static const LogLevel INFO = LogLevel._(1, _omitEnumNames ? '' : 'INFO');
  static const LogLevel WARNING = LogLevel._(2, _omitEnumNames ? '' : 'WARNING');
  static const LogLevel ERROR = LogLevel._(3, _omitEnumNames ? '' : 'ERROR');
  static const LogLevel CRITICAL = LogLevel._(4, _omitEnumNames ? '' : 'CRITICAL');

  static const $core.List<LogLevel> values = <LogLevel> [
    DEBUG,
    INFO,
    WARNING,
    ERROR,
    CRITICAL,
  ];

  static final $core.Map<$core.int, LogLevel> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LogLevel? valueOf($core.int value) => _byValue[value];

  const LogLevel._($core.int v, $core.String n) : super(v, n);
}

class HealthCheckRes_ServingStatus extends $pb.ProtobufEnum {
  static const HealthCheckRes_ServingStatus UNKNOWN = HealthCheckRes_ServingStatus._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const HealthCheckRes_ServingStatus SERVING = HealthCheckRes_ServingStatus._(1, _omitEnumNames ? '' : 'SERVING');
  static const HealthCheckRes_ServingStatus NOT_SERVING = HealthCheckRes_ServingStatus._(2, _omitEnumNames ? '' : 'NOT_SERVING');
  static const HealthCheckRes_ServingStatus SERVICE_UNKNOWN = HealthCheckRes_ServingStatus._(3, _omitEnumNames ? '' : 'SERVICE_UNKNOWN');

  static const $core.List<HealthCheckRes_ServingStatus> values = <HealthCheckRes_ServingStatus> [
    UNKNOWN,
    SERVING,
    NOT_SERVING,
    SERVICE_UNKNOWN,
  ];

  static final $core.Map<$core.int, HealthCheckRes_ServingStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static HealthCheckRes_ServingStatus? valueOf($core.int value) => _byValue[value];

  const HealthCheckRes_ServingStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
