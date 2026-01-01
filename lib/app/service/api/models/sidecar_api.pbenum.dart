// This is a generated file - do not edit.
//
// Generated from sidecar_api.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ParagraphType extends $pb.ProtobufEnum {
  static const ParagraphType PARAGRAPH_TYPE_UNSPECIFIED =
      ParagraphType._(0, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_UNSPECIFIED');
  static const ParagraphType PARAGRAPH_TYPE_QUOTE =
      ParagraphType._(1, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_QUOTE');
  static const ParagraphType PARAGRAPH_TYPE_REPLY_TO =
      ParagraphType._(2, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_REPLY_TO');
  static const ParagraphType PARAGRAPH_TYPE_TEXT =
      ParagraphType._(3, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_TEXT');
  static const ParagraphType PARAGRAPH_TYPE_NEW_LINE =
      ParagraphType._(7, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_NEW_LINE');
  static const ParagraphType PARAGRAPH_TYPE_IMAGE =
      ParagraphType._(4, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_IMAGE');
  static const ParagraphType PARAGRAPH_TYPE_LINK =
      ParagraphType._(5, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_LINK');
  static const ParagraphType PARAGRAPH_TYPE_VIDEO =
      ParagraphType._(6, _omitEnumNames ? '' : 'PARAGRAPH_TYPE_VIDEO');

  static const $core.List<ParagraphType> values = <ParagraphType>[
    PARAGRAPH_TYPE_UNSPECIFIED,
    PARAGRAPH_TYPE_QUOTE,
    PARAGRAPH_TYPE_REPLY_TO,
    PARAGRAPH_TYPE_TEXT,
    PARAGRAPH_TYPE_NEW_LINE,
    PARAGRAPH_TYPE_IMAGE,
    PARAGRAPH_TYPE_LINK,
    PARAGRAPH_TYPE_VIDEO,
  ];

  static final $core.List<ParagraphType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 7);
  static ParagraphType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ParagraphType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
