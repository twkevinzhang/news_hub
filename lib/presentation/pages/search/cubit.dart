part of 'index.dart';

@immutable
@CopyWith()
class SearchConfigForm {
  final Set<String> enabledExtensionPkgNames;
  final Set<String> enabledBoardIds;
  final List<String> boardsOrder;
  final Map<String, String> threadsSorting; // boardId -> sorting
  final String? keywords;

  const SearchConfigForm(
      {
        required this.enabledExtensionPkgNames,
        required this.enabledBoardIds,
        required this.boardsOrder,
        required this.threadsSorting,
        required this.keywords});
}

extension SearchConfigFormEx on SearchConfigForm {
  SearchConfigForm fromEntity(SearchConfig c) {
    return SearchConfigForm(
        enabledExtensionPkgNames: c.enabledExtensionPkgNames,
        enabledBoardIds: c.enabledBoardIds,
        boardsOrder: c.boardsOrder,
        threadsSorting: c.threadsSorting,
        keywords: c.keywords
    );
  }
}

@immutable
@CopyWith()
class SearchState extends Equatable {
  final int currentStep;
  final List<SearchConfig> allSearchConfigs;
  final List<Extension> allExtensions;
  final SearchConfigForm searchConfig;

  SearchState({
    this.currentStep = 0,
    this.allSearchConfigs = const [],
    this.allExtensions = const [],
    SearchConfigForm? searchConfig,
  }): searchConfig = searchConfig ?? SearchConfigForm(
    enabledExtensionPkgNames: {},
    enabledBoardIds: {},
    boardsOrder: [],
    threadsSorting: {},
    keywords: '',
  );

  @override
  List<Object?> get props => [currentStep, allSearchConfigs, allExtensions, searchConfig];
}

@lazySingleton
class SearchCubit extends Cubit<SearchState> {
  late final ListInstalledExtensions _listExtensions;
  late final PageController _pageController;
  get pageController => _pageController;

  SearchCubit({
    required ListSearchConfigs listSearchConfigs,
    required ListInstalledExtensions listExtensions,
  })  :
        _listExtensions = listExtensions,
        _pageController = PageController(),
        super(SearchState());

  @override
  Future<void> close() {
    _pageController.dispose();
    return super.close();
  }

  /// =====
  /// 頁面控制
  /// =====
  void updateStep(int step) {
    emit(state.copyWith(currentStep: step));
  }

  void nextStep() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  /// =====
  /// 啟用擴充功能頁面
  /// =====
  void loadExtensions() {
    _listExtensions.call().then((list) {
      emit(state.copyWith(allExtensions: list));
    });
  }

  void chooseExtension(Extension extension) {
    final newEnabledExtensionPkgNames = {...state.searchConfig.enabledExtensionPkgNames, extension.pkgName};
    emit(state.copyWith(searchConfig: state.searchConfig.copyWith(enabledExtensionPkgNames: newEnabledExtensionPkgNames)));
  }

  void unChooseExtension(Extension extension) {
    final newEnabledExtensionPkgNames = {...state.searchConfig.enabledExtensionPkgNames}..remove(extension.pkgName);
    emit(state.copyWith(searchConfig: state.searchConfig.copyWith(enabledExtensionPkgNames: newEnabledExtensionPkgNames)));
  }

  void chooseBoard(Board board) {
    final newEnabledBoardIds = {...state.searchConfig.enabledBoardIds, board.id};
    emit(state.copyWith(searchConfig: state.searchConfig.copyWith(enabledBoardIds: newEnabledBoardIds)));
  }

  void unChooseBoard(Board board) {
    final newEnabledBoardIds = {...state.searchConfig.enabledBoardIds}..remove(board.id);
    emit(state.copyWith(searchConfig: state.searchConfig.copyWith(enabledBoardIds: newEnabledBoardIds)));
  }

  /// =====
  /// 貼文排序頁面
  /// =====
  void changeThreadsSorting(String boardId, String sorting) {
    final newThreadsSorting = {...state.searchConfig.threadsSorting, boardId: sorting};
    emit(state.copyWith(searchConfig: state.searchConfig.copyWith(threadsSorting: newThreadsSorting)));
  }

  /// =====
  /// 關鍵字頁面
  /// =====
  void changeKeywords(String? keywords) {
    final k = (keywords?.trim().isEmpty ?? true) ? null : keywords?.trim();
    emit(state.copyWith(searchConfig: state.searchConfig.copyWith(keywords: k)));
  }
}
