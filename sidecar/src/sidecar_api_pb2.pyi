from google.protobuf.internal import containers as _containers
from google.protobuf.internal import enum_type_wrapper as _enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class ParagraphType(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    PARAGRAPH_TYPE_UNSPECIFIED: _ClassVar[ParagraphType]
    PARAGRAPH_TYPE_QUOTE: _ClassVar[ParagraphType]
    PARAGRAPH_TYPE_REPLY_TO: _ClassVar[ParagraphType]
    PARAGRAPH_TYPE_TEXT: _ClassVar[ParagraphType]
    PARAGRAPH_TYPE_NEW_LINE: _ClassVar[ParagraphType]
    PARAGRAPH_TYPE_IMAGE: _ClassVar[ParagraphType]
    PARAGRAPH_TYPE_LINK: _ClassVar[ParagraphType]
    PARAGRAPH_TYPE_VIDEO: _ClassVar[ParagraphType]

class LogLevel(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    DEBUG: _ClassVar[LogLevel]
    INFO: _ClassVar[LogLevel]
    WARNING: _ClassVar[LogLevel]
    ERROR: _ClassVar[LogLevel]
    CRITICAL: _ClassVar[LogLevel]
PARAGRAPH_TYPE_UNSPECIFIED: ParagraphType
PARAGRAPH_TYPE_QUOTE: ParagraphType
PARAGRAPH_TYPE_REPLY_TO: ParagraphType
PARAGRAPH_TYPE_TEXT: ParagraphType
PARAGRAPH_TYPE_NEW_LINE: ParagraphType
PARAGRAPH_TYPE_IMAGE: ParagraphType
PARAGRAPH_TYPE_LINK: ParagraphType
PARAGRAPH_TYPE_VIDEO: ParagraphType
DEBUG: LogLevel
INFO: LogLevel
WARNING: LogLevel
ERROR: LogLevel
CRITICAL: LogLevel

class PaginationReq(_message.Message):
    __slots__ = ("page", "page_size", "limit", "prev_cursor", "next_cursor")
    PAGE_FIELD_NUMBER: _ClassVar[int]
    PAGE_SIZE_FIELD_NUMBER: _ClassVar[int]
    LIMIT_FIELD_NUMBER: _ClassVar[int]
    PREV_CURSOR_FIELD_NUMBER: _ClassVar[int]
    NEXT_CURSOR_FIELD_NUMBER: _ClassVar[int]
    page: int
    page_size: int
    limit: int
    prev_cursor: str
    next_cursor: str
    def __init__(self, page: _Optional[int] = ..., page_size: _Optional[int] = ..., limit: _Optional[int] = ..., prev_cursor: _Optional[str] = ..., next_cursor: _Optional[str] = ...) -> None: ...

class PaginationRes(_message.Message):
    __slots__ = ("total_page", "current_page", "page_size", "prev_cursor", "next_cursor")
    TOTAL_PAGE_FIELD_NUMBER: _ClassVar[int]
    CURRENT_PAGE_FIELD_NUMBER: _ClassVar[int]
    PAGE_SIZE_FIELD_NUMBER: _ClassVar[int]
    PREV_CURSOR_FIELD_NUMBER: _ClassVar[int]
    NEXT_CURSOR_FIELD_NUMBER: _ClassVar[int]
    total_page: int
    current_page: int
    page_size: int
    prev_cursor: str
    next_cursor: str
    def __init__(self, total_page: _Optional[int] = ..., current_page: _Optional[int] = ..., page_size: _Optional[int] = ..., prev_cursor: _Optional[str] = ..., next_cursor: _Optional[str] = ...) -> None: ...

class Empty(_message.Message):
    __slots__ = ()
    def __init__(self) -> None: ...

class GetSiteReq(_message.Message):
    __slots__ = ("pkg_name",)
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    pkg_name: str
    def __init__(self, pkg_name: _Optional[str] = ...) -> None: ...

class GetSiteRes(_message.Message):
    __slots__ = ("site",)
    SITE_FIELD_NUMBER: _ClassVar[int]
    site: Site
    def __init__(self, site: _Optional[_Union[Site, _Mapping]] = ...) -> None: ...

class Site(_message.Message):
    __slots__ = ("pkg_name", "id", "icon", "name", "description", "url")
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    ID_FIELD_NUMBER: _ClassVar[int]
    ICON_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    DESCRIPTION_FIELD_NUMBER: _ClassVar[int]
    URL_FIELD_NUMBER: _ClassVar[int]
    pkg_name: str
    id: str
    icon: str
    name: str
    description: str
    url: str
    def __init__(self, pkg_name: _Optional[str] = ..., id: _Optional[str] = ..., icon: _Optional[str] = ..., name: _Optional[str] = ..., description: _Optional[str] = ..., url: _Optional[str] = ...) -> None: ...

class GetBoardsReq(_message.Message):
    __slots__ = ("pkg_name", "site_id", "page")
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    SITE_ID_FIELD_NUMBER: _ClassVar[int]
    PAGE_FIELD_NUMBER: _ClassVar[int]
    pkg_name: str
    site_id: str
    page: PaginationReq
    def __init__(self, pkg_name: _Optional[str] = ..., site_id: _Optional[str] = ..., page: _Optional[_Union[PaginationReq, _Mapping]] = ...) -> None: ...

class GetBoardsRes(_message.Message):
    __slots__ = ("boards", "page")
    BOARDS_FIELD_NUMBER: _ClassVar[int]
    PAGE_FIELD_NUMBER: _ClassVar[int]
    boards: _containers.RepeatedCompositeFieldContainer[Board]
    page: PaginationRes
    def __init__(self, boards: _Optional[_Iterable[_Union[Board, _Mapping]]] = ..., page: _Optional[_Union[PaginationRes, _Mapping]] = ...) -> None: ...

class Board(_message.Message):
    __slots__ = ("pkg_name", "site_id", "id", "name", "icon", "large_welcome_image", "url", "supported_threads_sorting")
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    SITE_ID_FIELD_NUMBER: _ClassVar[int]
    ID_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    ICON_FIELD_NUMBER: _ClassVar[int]
    LARGE_WELCOME_IMAGE_FIELD_NUMBER: _ClassVar[int]
    URL_FIELD_NUMBER: _ClassVar[int]
    SUPPORTED_THREADS_SORTING_FIELD_NUMBER: _ClassVar[int]
    pkg_name: str
    site_id: str
    id: str
    name: str
    icon: str
    large_welcome_image: str
    url: str
    supported_threads_sorting: _containers.RepeatedScalarFieldContainer[str]
    def __init__(self, pkg_name: _Optional[str] = ..., site_id: _Optional[str] = ..., id: _Optional[str] = ..., name: _Optional[str] = ..., icon: _Optional[str] = ..., large_welcome_image: _Optional[str] = ..., url: _Optional[str] = ..., supported_threads_sorting: _Optional[_Iterable[str]] = ...) -> None: ...

class GetThreadInfosReq(_message.Message):
    __slots__ = ("pkg_name", "site_id", "boards_sorting", "page", "keywords")
    class BoardsSortingEntry(_message.Message):
        __slots__ = ("key", "value")
        KEY_FIELD_NUMBER: _ClassVar[int]
        VALUE_FIELD_NUMBER: _ClassVar[int]
        key: str
        value: str
        def __init__(self, key: _Optional[str] = ..., value: _Optional[str] = ...) -> None: ...
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    SITE_ID_FIELD_NUMBER: _ClassVar[int]
    BOARDS_SORTING_FIELD_NUMBER: _ClassVar[int]
    PAGE_FIELD_NUMBER: _ClassVar[int]
    KEYWORDS_FIELD_NUMBER: _ClassVar[int]
    pkg_name: str
    site_id: str
    boards_sorting: _containers.ScalarMap[str, str]
    page: PaginationReq
    keywords: str
    def __init__(self, pkg_name: _Optional[str] = ..., site_id: _Optional[str] = ..., boards_sorting: _Optional[_Mapping[str, str]] = ..., page: _Optional[_Union[PaginationReq, _Mapping]] = ..., keywords: _Optional[str] = ...) -> None: ...

class GetThreadInfosRes(_message.Message):
    __slots__ = ("thread_infos", "page")
    THREAD_INFOS_FIELD_NUMBER: _ClassVar[int]
    PAGE_FIELD_NUMBER: _ClassVar[int]
    thread_infos: _containers.RepeatedCompositeFieldContainer[Post]
    page: PaginationRes
    def __init__(self, thread_infos: _Optional[_Iterable[_Union[Post, _Mapping]]] = ..., page: _Optional[_Union[PaginationRes, _Mapping]] = ...) -> None: ...

class GetThreadPostReq(_message.Message):
    __slots__ = ("pkg_name", "site_id", "board_id", "thread_id", "post_id")
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    SITE_ID_FIELD_NUMBER: _ClassVar[int]
    BOARD_ID_FIELD_NUMBER: _ClassVar[int]
    THREAD_ID_FIELD_NUMBER: _ClassVar[int]
    POST_ID_FIELD_NUMBER: _ClassVar[int]
    pkg_name: str
    site_id: str
    board_id: str
    thread_id: str
    post_id: str
    def __init__(self, pkg_name: _Optional[str] = ..., site_id: _Optional[str] = ..., board_id: _Optional[str] = ..., thread_id: _Optional[str] = ..., post_id: _Optional[str] = ...) -> None: ...

class GetThreadPostRes(_message.Message):
    __slots__ = ("thread_post",)
    THREAD_POST_FIELD_NUMBER: _ClassVar[int]
    thread_post: Post
    def __init__(self, thread_post: _Optional[_Union[Post, _Mapping]] = ...) -> None: ...

class GetRegardingPostsReq(_message.Message):
    __slots__ = ("pkg_name", "site_id", "board_id", "thread_id", "reply_to_id", "page")
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    SITE_ID_FIELD_NUMBER: _ClassVar[int]
    BOARD_ID_FIELD_NUMBER: _ClassVar[int]
    THREAD_ID_FIELD_NUMBER: _ClassVar[int]
    REPLY_TO_ID_FIELD_NUMBER: _ClassVar[int]
    PAGE_FIELD_NUMBER: _ClassVar[int]
    pkg_name: str
    site_id: str
    board_id: str
    thread_id: str
    reply_to_id: str
    page: PaginationReq
    def __init__(self, pkg_name: _Optional[str] = ..., site_id: _Optional[str] = ..., board_id: _Optional[str] = ..., thread_id: _Optional[str] = ..., reply_to_id: _Optional[str] = ..., page: _Optional[_Union[PaginationReq, _Mapping]] = ...) -> None: ...

class GetRegardingPostsRes(_message.Message):
    __slots__ = ("regarding_posts", "page")
    REGARDING_POSTS_FIELD_NUMBER: _ClassVar[int]
    PAGE_FIELD_NUMBER: _ClassVar[int]
    regarding_posts: _containers.RepeatedCompositeFieldContainer[Post]
    page: PaginationRes
    def __init__(self, regarding_posts: _Optional[_Iterable[_Union[Post, _Mapping]]] = ..., page: _Optional[_Union[PaginationRes, _Mapping]] = ...) -> None: ...

class Paragraph(_message.Message):
    __slots__ = ("type", "image", "video", "text", "new_line", "quote", "reply_to", "link")
    TYPE_FIELD_NUMBER: _ClassVar[int]
    IMAGE_FIELD_NUMBER: _ClassVar[int]
    VIDEO_FIELD_NUMBER: _ClassVar[int]
    TEXT_FIELD_NUMBER: _ClassVar[int]
    NEW_LINE_FIELD_NUMBER: _ClassVar[int]
    QUOTE_FIELD_NUMBER: _ClassVar[int]
    REPLY_TO_FIELD_NUMBER: _ClassVar[int]
    LINK_FIELD_NUMBER: _ClassVar[int]
    type: ParagraphType
    image: ImageParagraph
    video: VideoParagraph
    text: TextParagraph
    new_line: NewLineParagraph
    quote: QuoteParagraph
    reply_to: ReplyToParagraph
    link: LinkParagraph
    def __init__(self, type: _Optional[_Union[ParagraphType, str]] = ..., image: _Optional[_Union[ImageParagraph, _Mapping]] = ..., video: _Optional[_Union[VideoParagraph, _Mapping]] = ..., text: _Optional[_Union[TextParagraph, _Mapping]] = ..., new_line: _Optional[_Union[NewLineParagraph, _Mapping]] = ..., quote: _Optional[_Union[QuoteParagraph, _Mapping]] = ..., reply_to: _Optional[_Union[ReplyToParagraph, _Mapping]] = ..., link: _Optional[_Union[LinkParagraph, _Mapping]] = ...) -> None: ...

class ImageParagraph(_message.Message):
    __slots__ = ("thumb", "raw")
    THUMB_FIELD_NUMBER: _ClassVar[int]
    RAW_FIELD_NUMBER: _ClassVar[int]
    thumb: str
    raw: str
    def __init__(self, thumb: _Optional[str] = ..., raw: _Optional[str] = ...) -> None: ...

class VideoParagraph(_message.Message):
    __slots__ = ("thumb", "url")
    THUMB_FIELD_NUMBER: _ClassVar[int]
    URL_FIELD_NUMBER: _ClassVar[int]
    thumb: str
    url: str
    def __init__(self, thumb: _Optional[str] = ..., url: _Optional[str] = ...) -> None: ...

class TextParagraph(_message.Message):
    __slots__ = ("content",)
    CONTENT_FIELD_NUMBER: _ClassVar[int]
    content: str
    def __init__(self, content: _Optional[str] = ...) -> None: ...

class NewLineParagraph(_message.Message):
    __slots__ = ("symbol",)
    SYMBOL_FIELD_NUMBER: _ClassVar[int]
    symbol: str
    def __init__(self, symbol: _Optional[str] = ...) -> None: ...

class QuoteParagraph(_message.Message):
    __slots__ = ("content",)
    CONTENT_FIELD_NUMBER: _ClassVar[int]
    content: str
    def __init__(self, content: _Optional[str] = ...) -> None: ...

class ReplyToParagraph(_message.Message):
    __slots__ = ("id", "author_name", "preview")
    ID_FIELD_NUMBER: _ClassVar[int]
    AUTHOR_NAME_FIELD_NUMBER: _ClassVar[int]
    PREVIEW_FIELD_NUMBER: _ClassVar[int]
    id: str
    author_name: str
    preview: str
    def __init__(self, id: _Optional[str] = ..., author_name: _Optional[str] = ..., preview: _Optional[str] = ...) -> None: ...

class LinkParagraph(_message.Message):
    __slots__ = ("content",)
    CONTENT_FIELD_NUMBER: _ClassVar[int]
    content: str
    def __init__(self, content: _Optional[str] = ...) -> None: ...

class Post(_message.Message):
    __slots__ = ("pkg_name", "site_id", "board_id", "thread_id", "id", "article_post", "single_image_post")
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    SITE_ID_FIELD_NUMBER: _ClassVar[int]
    BOARD_ID_FIELD_NUMBER: _ClassVar[int]
    THREAD_ID_FIELD_NUMBER: _ClassVar[int]
    ID_FIELD_NUMBER: _ClassVar[int]
    ARTICLE_POST_FIELD_NUMBER: _ClassVar[int]
    SINGLE_IMAGE_POST_FIELD_NUMBER: _ClassVar[int]
    pkg_name: str
    site_id: str
    board_id: str
    thread_id: str
    id: str
    article_post: ArticlePost
    single_image_post: SingleImagePost
    def __init__(self, pkg_name: _Optional[str] = ..., site_id: _Optional[str] = ..., board_id: _Optional[str] = ..., thread_id: _Optional[str] = ..., id: _Optional[str] = ..., article_post: _Optional[_Union[ArticlePost, _Mapping]] = ..., single_image_post: _Optional[_Union[SingleImagePost, _Mapping]] = ...) -> None: ...

class ArticlePost(_message.Message):
    __slots__ = ("author_id", "author_name", "created_at", "title", "liked", "disliked", "contents", "tags", "latest_regarding_post_created_at", "regarding_posts_count", "url")
    AUTHOR_ID_FIELD_NUMBER: _ClassVar[int]
    AUTHOR_NAME_FIELD_NUMBER: _ClassVar[int]
    CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    TITLE_FIELD_NUMBER: _ClassVar[int]
    LIKED_FIELD_NUMBER: _ClassVar[int]
    DISLIKED_FIELD_NUMBER: _ClassVar[int]
    CONTENTS_FIELD_NUMBER: _ClassVar[int]
    TAGS_FIELD_NUMBER: _ClassVar[int]
    LATEST_REGARDING_POST_CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    REGARDING_POSTS_COUNT_FIELD_NUMBER: _ClassVar[int]
    URL_FIELD_NUMBER: _ClassVar[int]
    author_id: str
    author_name: str
    created_at: int
    title: str
    liked: int
    disliked: int
    contents: _containers.RepeatedCompositeFieldContainer[Paragraph]
    tags: _containers.RepeatedScalarFieldContainer[str]
    latest_regarding_post_created_at: int
    regarding_posts_count: int
    url: str
    def __init__(self, author_id: _Optional[str] = ..., author_name: _Optional[str] = ..., created_at: _Optional[int] = ..., title: _Optional[str] = ..., liked: _Optional[int] = ..., disliked: _Optional[int] = ..., contents: _Optional[_Iterable[_Union[Paragraph, _Mapping]]] = ..., tags: _Optional[_Iterable[str]] = ..., latest_regarding_post_created_at: _Optional[int] = ..., regarding_posts_count: _Optional[int] = ..., url: _Optional[str] = ...) -> None: ...

class SingleImagePost(_message.Message):
    __slots__ = ("author_id", "author_name", "created_at", "title", "liked", "disliked", "image", "contents", "tags", "latest_regarding_post_created_at", "regarding_posts_count", "url")
    AUTHOR_ID_FIELD_NUMBER: _ClassVar[int]
    AUTHOR_NAME_FIELD_NUMBER: _ClassVar[int]
    CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    TITLE_FIELD_NUMBER: _ClassVar[int]
    LIKED_FIELD_NUMBER: _ClassVar[int]
    DISLIKED_FIELD_NUMBER: _ClassVar[int]
    IMAGE_FIELD_NUMBER: _ClassVar[int]
    CONTENTS_FIELD_NUMBER: _ClassVar[int]
    TAGS_FIELD_NUMBER: _ClassVar[int]
    LATEST_REGARDING_POST_CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    REGARDING_POSTS_COUNT_FIELD_NUMBER: _ClassVar[int]
    URL_FIELD_NUMBER: _ClassVar[int]
    author_id: str
    author_name: str
    created_at: int
    title: str
    liked: int
    disliked: int
    image: ImageParagraph
    contents: _containers.RepeatedCompositeFieldContainer[Paragraph]
    tags: _containers.RepeatedScalarFieldContainer[str]
    latest_regarding_post_created_at: int
    regarding_posts_count: int
    url: str
    def __init__(self, author_id: _Optional[str] = ..., author_name: _Optional[str] = ..., created_at: _Optional[int] = ..., title: _Optional[str] = ..., liked: _Optional[int] = ..., disliked: _Optional[int] = ..., image: _Optional[_Union[ImageParagraph, _Mapping]] = ..., contents: _Optional[_Iterable[_Union[Paragraph, _Mapping]]] = ..., tags: _Optional[_Iterable[str]] = ..., latest_regarding_post_created_at: _Optional[int] = ..., regarding_posts_count: _Optional[int] = ..., url: _Optional[str] = ...) -> None: ...

class GetCommentsReq(_message.Message):
    __slots__ = ("pkg_name", "site_id", "board_id", "thread_id", "post_id", "page")
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    SITE_ID_FIELD_NUMBER: _ClassVar[int]
    BOARD_ID_FIELD_NUMBER: _ClassVar[int]
    THREAD_ID_FIELD_NUMBER: _ClassVar[int]
    POST_ID_FIELD_NUMBER: _ClassVar[int]
    PAGE_FIELD_NUMBER: _ClassVar[int]
    pkg_name: str
    site_id: str
    board_id: str
    thread_id: str
    post_id: str
    page: PaginationReq
    def __init__(self, pkg_name: _Optional[str] = ..., site_id: _Optional[str] = ..., board_id: _Optional[str] = ..., thread_id: _Optional[str] = ..., post_id: _Optional[str] = ..., page: _Optional[_Union[PaginationReq, _Mapping]] = ...) -> None: ...

class GetCommentsRes(_message.Message):
    __slots__ = ("comments", "page")
    COMMENTS_FIELD_NUMBER: _ClassVar[int]
    PAGE_FIELD_NUMBER: _ClassVar[int]
    comments: _containers.RepeatedCompositeFieldContainer[Comment]
    page: PaginationRes
    def __init__(self, comments: _Optional[_Iterable[_Union[Comment, _Mapping]]] = ..., page: _Optional[_Union[PaginationRes, _Mapping]] = ...) -> None: ...

class Comment(_message.Message):
    __slots__ = ("pkg_name", "site_id", "board_id", "thread_id", "post_id", "id", "author_id", "author_name", "contents", "created_at")
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    SITE_ID_FIELD_NUMBER: _ClassVar[int]
    BOARD_ID_FIELD_NUMBER: _ClassVar[int]
    THREAD_ID_FIELD_NUMBER: _ClassVar[int]
    POST_ID_FIELD_NUMBER: _ClassVar[int]
    ID_FIELD_NUMBER: _ClassVar[int]
    AUTHOR_ID_FIELD_NUMBER: _ClassVar[int]
    AUTHOR_NAME_FIELD_NUMBER: _ClassVar[int]
    CONTENTS_FIELD_NUMBER: _ClassVar[int]
    CREATED_AT_FIELD_NUMBER: _ClassVar[int]
    pkg_name: str
    site_id: str
    board_id: str
    thread_id: str
    post_id: str
    id: str
    author_id: str
    author_name: str
    contents: _containers.RepeatedCompositeFieldContainer[Paragraph]
    created_at: int
    def __init__(self, pkg_name: _Optional[str] = ..., site_id: _Optional[str] = ..., board_id: _Optional[str] = ..., thread_id: _Optional[str] = ..., post_id: _Optional[str] = ..., id: _Optional[str] = ..., author_id: _Optional[str] = ..., author_name: _Optional[str] = ..., contents: _Optional[_Iterable[_Union[Paragraph, _Mapping]]] = ..., created_at: _Optional[int] = ...) -> None: ...

class ListInstalledExtensionsRes(_message.Message):
    __slots__ = ("extensions",)
    EXTENSIONS_FIELD_NUMBER: _ClassVar[int]
    extensions: _containers.RepeatedCompositeFieldContainer[Extension]
    def __init__(self, extensions: _Optional[_Iterable[_Union[Extension, _Mapping]]] = ...) -> None: ...

class GetInstalledExtensionReq(_message.Message):
    __slots__ = ("pkg_name",)
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    pkg_name: str
    def __init__(self, pkg_name: _Optional[str] = ...) -> None: ...

class GetInstalledExtensionRes(_message.Message):
    __slots__ = ("extension",)
    EXTENSION_FIELD_NUMBER: _ClassVar[int]
    extension: Extension
    def __init__(self, extension: _Optional[_Union[Extension, _Mapping]] = ...) -> None: ...

class InstallExtensionReq(_message.Message):
    __slots__ = ("pkg_name", "zip_name", "repo_base_url")
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    ZIP_NAME_FIELD_NUMBER: _ClassVar[int]
    REPO_BASE_URL_FIELD_NUMBER: _ClassVar[int]
    pkg_name: str
    zip_name: str
    repo_base_url: str
    def __init__(self, pkg_name: _Optional[str] = ..., zip_name: _Optional[str] = ..., repo_base_url: _Optional[str] = ...) -> None: ...

class UninstallExtensionReq(_message.Message):
    __slots__ = ("pkg_name",)
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    pkg_name: str
    def __init__(self, pkg_name: _Optional[str] = ...) -> None: ...

class GetInstallProgressReq(_message.Message):
    __slots__ = ("pkg_name",)
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    pkg_name: str
    def __init__(self, pkg_name: _Optional[str] = ...) -> None: ...

class GetInstallProgressRes(_message.Message):
    __slots__ = ("sites",)
    SITES_FIELD_NUMBER: _ClassVar[int]
    sites: _containers.RepeatedCompositeFieldContainer[Site]
    def __init__(self, sites: _Optional[_Iterable[_Union[Site, _Mapping]]] = ...) -> None: ...

class ListRemoteExtensionsReq(_message.Message):
    __slots__ = ("repo_base_url",)
    REPO_BASE_URL_FIELD_NUMBER: _ClassVar[int]
    repo_base_url: str
    def __init__(self, repo_base_url: _Optional[str] = ...) -> None: ...

class ListRemoteExtensionsRes(_message.Message):
    __slots__ = ("extensions",)
    EXTENSIONS_FIELD_NUMBER: _ClassVar[int]
    extensions: _containers.RepeatedCompositeFieldContainer[RemoteExtension]
    def __init__(self, extensions: _Optional[_Iterable[_Union[RemoteExtension, _Mapping]]] = ...) -> None: ...

class RemoteExtension(_message.Message):
    __slots__ = ("base", "icon_url", "repo_url")
    BASE_FIELD_NUMBER: _ClassVar[int]
    ICON_URL_FIELD_NUMBER: _ClassVar[int]
    REPO_URL_FIELD_NUMBER: _ClassVar[int]
    base: Extension
    icon_url: str
    repo_url: str
    def __init__(self, base: _Optional[_Union[Extension, _Mapping]] = ..., icon_url: _Optional[str] = ..., repo_url: _Optional[str] = ...) -> None: ...

class Extension(_message.Message):
    __slots__ = ("repo_base_url", "pkg_name", "display_name", "zip_name", "version", "python_version", "lang", "is_nsfw")
    REPO_BASE_URL_FIELD_NUMBER: _ClassVar[int]
    PKG_NAME_FIELD_NUMBER: _ClassVar[int]
    DISPLAY_NAME_FIELD_NUMBER: _ClassVar[int]
    ZIP_NAME_FIELD_NUMBER: _ClassVar[int]
    VERSION_FIELD_NUMBER: _ClassVar[int]
    PYTHON_VERSION_FIELD_NUMBER: _ClassVar[int]
    LANG_FIELD_NUMBER: _ClassVar[int]
    IS_NSFW_FIELD_NUMBER: _ClassVar[int]
    repo_base_url: str
    pkg_name: str
    display_name: str
    zip_name: str
    version: int
    python_version: int
    lang: str
    is_nsfw: bool
    def __init__(self, repo_base_url: _Optional[str] = ..., pkg_name: _Optional[str] = ..., display_name: _Optional[str] = ..., zip_name: _Optional[str] = ..., version: _Optional[int] = ..., python_version: _Optional[int] = ..., lang: _Optional[str] = ..., is_nsfw: bool = ...) -> None: ...

class ExtensionRepo(_message.Message):
    __slots__ = ("url", "added_at", "display_name", "website", "signing_key_fingerprint", "icon")
    URL_FIELD_NUMBER: _ClassVar[int]
    ADDED_AT_FIELD_NUMBER: _ClassVar[int]
    DISPLAY_NAME_FIELD_NUMBER: _ClassVar[int]
    WEBSITE_FIELD_NUMBER: _ClassVar[int]
    SIGNING_KEY_FINGERPRINT_FIELD_NUMBER: _ClassVar[int]
    ICON_FIELD_NUMBER: _ClassVar[int]
    url: str
    added_at: int
    display_name: str
    website: str
    signing_key_fingerprint: str
    icon: str
    def __init__(self, url: _Optional[str] = ..., added_at: _Optional[int] = ..., display_name: _Optional[str] = ..., website: _Optional[str] = ..., signing_key_fingerprint: _Optional[str] = ..., icon: _Optional[str] = ...) -> None: ...

class AddExtensionRepoReq(_message.Message):
    __slots__ = ("url",)
    URL_FIELD_NUMBER: _ClassVar[int]
    url: str
    def __init__(self, url: _Optional[str] = ...) -> None: ...

class AddExtensionRepoRes(_message.Message):
    __slots__ = ("url", "added_at", "display_name", "website", "signing_key_fingerprint", "icon")
    URL_FIELD_NUMBER: _ClassVar[int]
    ADDED_AT_FIELD_NUMBER: _ClassVar[int]
    DISPLAY_NAME_FIELD_NUMBER: _ClassVar[int]
    WEBSITE_FIELD_NUMBER: _ClassVar[int]
    SIGNING_KEY_FINGERPRINT_FIELD_NUMBER: _ClassVar[int]
    ICON_FIELD_NUMBER: _ClassVar[int]
    url: str
    added_at: int
    display_name: str
    website: str
    signing_key_fingerprint: str
    icon: str
    def __init__(self, url: _Optional[str] = ..., added_at: _Optional[int] = ..., display_name: _Optional[str] = ..., website: _Optional[str] = ..., signing_key_fingerprint: _Optional[str] = ..., icon: _Optional[str] = ...) -> None: ...

class RemoveExtensionRepoReq(_message.Message):
    __slots__ = ("url",)
    URL_FIELD_NUMBER: _ClassVar[int]
    url: str
    def __init__(self, url: _Optional[str] = ...) -> None: ...

class ListExtensionReposRes(_message.Message):
    __slots__ = ("repos",)
    REPOS_FIELD_NUMBER: _ClassVar[int]
    repos: _containers.RepeatedCompositeFieldContainer[ExtensionRepo]
    def __init__(self, repos: _Optional[_Iterable[_Union[ExtensionRepo, _Mapping]]] = ...) -> None: ...

class HealthCheckReq(_message.Message):
    __slots__ = ("service",)
    SERVICE_FIELD_NUMBER: _ClassVar[int]
    service: str
    def __init__(self, service: _Optional[str] = ...) -> None: ...

class HealthCheckRes(_message.Message):
    __slots__ = ("status", "message")
    class ServingStatus(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
        __slots__ = ()
        UNKNOWN: _ClassVar[HealthCheckRes.ServingStatus]
        SERVING: _ClassVar[HealthCheckRes.ServingStatus]
        NOT_SERVING: _ClassVar[HealthCheckRes.ServingStatus]
        SERVICE_UNKNOWN: _ClassVar[HealthCheckRes.ServingStatus]
    UNKNOWN: HealthCheckRes.ServingStatus
    SERVING: HealthCheckRes.ServingStatus
    NOT_SERVING: HealthCheckRes.ServingStatus
    SERVICE_UNKNOWN: HealthCheckRes.ServingStatus
    STATUS_FIELD_NUMBER: _ClassVar[int]
    MESSAGE_FIELD_NUMBER: _ClassVar[int]
    status: HealthCheckRes.ServingStatus
    message: str
    def __init__(self, status: _Optional[_Union[HealthCheckRes.ServingStatus, str]] = ..., message: _Optional[str] = ...) -> None: ...

class LogEntry(_message.Message):
    __slots__ = ("timestamp", "level", "logger_name", "message", "exception")
    TIMESTAMP_FIELD_NUMBER: _ClassVar[int]
    LEVEL_FIELD_NUMBER: _ClassVar[int]
    LOGGER_NAME_FIELD_NUMBER: _ClassVar[int]
    MESSAGE_FIELD_NUMBER: _ClassVar[int]
    EXCEPTION_FIELD_NUMBER: _ClassVar[int]
    timestamp: int
    level: LogLevel
    logger_name: str
    message: str
    exception: str
    def __init__(self, timestamp: _Optional[int] = ..., level: _Optional[_Union[LogLevel, str]] = ..., logger_name: _Optional[str] = ..., message: _Optional[str] = ..., exception: _Optional[str] = ...) -> None: ...

class WatchLogsReq(_message.Message):
    __slots__ = ("min_level", "logger_filter")
    MIN_LEVEL_FIELD_NUMBER: _ClassVar[int]
    LOGGER_FILTER_FIELD_NUMBER: _ClassVar[int]
    min_level: LogLevel
    logger_filter: str
    def __init__(self, min_level: _Optional[_Union[LogLevel, str]] = ..., logger_filter: _Optional[str] = ...) -> None: ...

class GetLogsReq(_message.Message):
    __slots__ = ("start_time", "end_time", "min_level", "logger_filter", "limit")
    START_TIME_FIELD_NUMBER: _ClassVar[int]
    END_TIME_FIELD_NUMBER: _ClassVar[int]
    MIN_LEVEL_FIELD_NUMBER: _ClassVar[int]
    LOGGER_FILTER_FIELD_NUMBER: _ClassVar[int]
    LIMIT_FIELD_NUMBER: _ClassVar[int]
    start_time: int
    end_time: int
    min_level: LogLevel
    logger_filter: str
    limit: int
    def __init__(self, start_time: _Optional[int] = ..., end_time: _Optional[int] = ..., min_level: _Optional[_Union[LogLevel, str]] = ..., logger_filter: _Optional[str] = ..., limit: _Optional[int] = ...) -> None: ...

class GetLogsRes(_message.Message):
    __slots__ = ("entries",)
    ENTRIES_FIELD_NUMBER: _ClassVar[int]
    entries: _containers.RepeatedCompositeFieldContainer[LogEntry]
    def __init__(self, entries: _Optional[_Iterable[_Union[LogEntry, _Mapping]]] = ...) -> None: ...

class SetLogLevelReq(_message.Message):
    __slots__ = ("level",)
    LEVEL_FIELD_NUMBER: _ClassVar[int]
    level: LogLevel
    def __init__(self, level: _Optional[_Union[LogLevel, str]] = ...) -> None: ...
