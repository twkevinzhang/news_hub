part of 'index.dart';

@Freezed(toJson: true)
class CommentsDto with _$CommentsDto {
  const factory CommentsDto({
    @JsonKey(name: 'total_page', required: true)
    required int totalPage,

    @JsonKey(name: 'current_page', required: true)
    required int currentPage,

    @JsonKey(name: 'comments', required: true)
    required List<CommentDto> comments
  }) = _CommentsDto;

  factory CommentsDto.fromJson(Map<String, dynamic> json) => _$CommentsDtoFromJson(json);
}

@Freezed(toJson: true)
class CommentDto with _$CommentDto {
  const factory CommentDto({
    @JsonKey(name: 'id', required: true)
    required String id,

    @JsonKey(name: 'contents', required: true)
    required List<ParagraphDto> contents,
  }) = _CommentDto;

  factory CommentDto.fromJson(Map<String, dynamic> json) => _$CommentDtoFromJson(json);
}

extension CommentDtoExtension on CommentDto {
  Comment toComment() {
    return Comment(
      id: id,
      contents: contents.map((e) => e.toParagraph()).toList(),
    );
  }
}
