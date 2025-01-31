part of 'index.dart';

@immutable
@CopyWith()
class ExtensionsState extends Equatable {
  final String? keyword;
  final Extensions extensions;

  ExtensionsState({
    this.keyword,
    Extensions? extensions,
  })  : extensions = extensions ??
            Extensions(
              updates: {},
              deprecated: {},
              installed: {},
              notInstalled: {},
            );

  @override
  List<Object?> get props => [extensions, keyword];
}

@lazySingleton
class ExtensionsCubit extends Cubit<ExtensionsState> {
  final ListExtensions _listExtensions;
  final SearchController _searchController;
  get searchController => _searchController;

  ExtensionsCubit({
    required ListExtensions listExtensions,
  })  : _listExtensions = listExtensions,
        _searchController = SearchController(),
        super(ExtensionsState());

  void loadExtensions() async {
    _listExtensions.call(state.keyword).listen((result) {
      emit(state.copyWith(extensions: result));
    });
  }

  void changeKeywords(String keyword) {
    emit(state.copyWith(keyword: keyword));
  }

  void updateExtension(Extension extension) {
    // ...
  }

  void installExtension(Extension extension) {
    // ...
  }

  void validateRepoUrl(String url) {
    // ...
  }

  void createRepo(ExtensionRepo repo) {
    // ...
  }
}
