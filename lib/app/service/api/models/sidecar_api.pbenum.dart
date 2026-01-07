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
