import 'package:news_hub/domain/models/board/board.dart';
import 'package:news_hub/domain/models/extension/extension.dart';

class RemoteExtension extends Extension {
  final String iconUrl;
  final String repoUrl;

  RemoteExtension({
    required super.pkgName,
    required super.displayName,
    required super.version,
    required super.pythonVersion,
    required super.lang,
    required super.isNsfw,
    required this.repoUrl,
    required this.iconUrl,
  });
}

extension RemoteExtensionEx on RemoteExtension {
  RemoteExtension copyWith({
    String? pkgName,
    String? displayName,
    int? version,
    int? pythonVersion,
    String? lang,
    bool? isNsfw,
    String? iconUrl,
    String? repoUrl,
    Set<Board> boards = const {},
  }) {
    return RemoteExtension(
      pkgName: pkgName ?? this.pkgName,
      displayName: displayName ?? this.displayName,
      version: version ?? this.version,
      pythonVersion: pythonVersion ?? this.pythonVersion,
      lang: lang ?? this.lang,
      isNsfw: isNsfw ?? this.isNsfw,
      iconUrl: iconUrl ?? this.iconUrl,
      repoUrl: repoUrl ?? this.repoUrl,
    );
  }
}
