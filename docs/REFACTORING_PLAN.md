# News Hub 重構計劃 (AI Agents 專用)

**文件版本**: 1.0
**建立日期**: 2026-01-15
**適用對象**: AI Development Agents
**方法論**: Spec-Driven Development + Test-Driven Development

---

## 📋 總覽

本重構計劃基於 [CODE_QUALITY_REPORT.md](./CODE_QUALITY_REPORT.md) 的分析結果，旨在提升程式碼品質至符合 [CONTRIBUTING.md](../CONTRIBUTING.md) 規範的標準。

### 🎯 重構目標

| 目標項目 | 當前狀態 | 目標狀態 | 優先級 |
|---------|---------|---------|--------|
| Domain Models 一致性 | 混合 plain class/freezed | 全部使用 freezed | 🔴 高 |
| BLoC 測試覆蓋率 | ~15% | 80%+ | 🔴 高 |
| 過時 API 使用 | 使用 deprecated API | 移除所有過時 API | 🔴 高 |
| BLoC 效能優化 | 未優化 | 重建次數減少 > 80% | 🟡 中 |
| 測試程式碼品質 | 18 處缺少 const | 0 warnings | 🟡 中 |

### 📐 方法論原則

**Spec-Driven Development (SDD)**:
1. 定義規格 (Specification) - 明確定義期望行為
2. 撰寫驗收標準 (Acceptance Criteria)
3. 實作功能以滿足規格
4. 驗證符合規格

**Test-Driven Development (TDD)**:
1. 🔴 **Red** - 先寫失敗的測試
2. 🟢 **Green** - 寫最少程式碼讓測試通過
3. 🔵 **Refactor** - 重構並保持測試通過

---

## 🗺️ 任務總覽

### 階段一：基礎架構改進 (高優先級)

- **Task 1**: Domain Models 遷移至 Freezed (預計 4-6 小時)
- **Task 2**: 補充 BLoC 測試覆蓋 - Phase 1 核心 BLoCs (預計 8-10 小時)
- **Task 3**: 移除過時 API (預計 1-2 小時)

### 階段二：效能與品質優化 (中優先級)

- **Task 4**: BLoC 效能優化 (預計 4-6 小時)
- **Task 5**: 清理測試程式碼 warnings (預計 1-2 小時)

### 階段三：完整測試覆蓋 (中優先級)

- **Task 6**: 補充 BLoC 測試覆蓋 - Phase 2 其餘 BLoCs (預計 6-8 小時)

---

## 📝 詳細任務規格

---

## Task 1: Domain Models 遷移至 Freezed

### 📐 規格 (Specification)

**目標**: 將所有 Domain Models 從 plain class 遷移至 freezed，確保不可變性、類型安全和便利方法。

**範圍**:
- `lib/domain/models/collection/collection.dart`
- `lib/domain/models/collection/collection_board.dart`
- `lib/domain/models/extension/extension.dart`
- `lib/domain/models/extension/extension_metadata.dart`
- 其他使用 plain class 的 domain models

**為什麼需要**:
- 確保領域模型的不可變性
- 提供 `copyWith`、`==`、`hashCode` 等便利方法
- 防止 `List`、`Map` 等可變集合被外部修改
- 與 BLoC States 保持一致性

### ✅ 驗收標準 (Acceptance Criteria)

1. 所有 domain models 使用 `@freezed` 註解
2. 所有集合類型（List, Map）使用不可變集合
3. 提供 `copyWith` 方法用於更新
4. 提供正確的 `==` 和 `hashCode` 實現
5. 所有使用這些 models 的程式碼仍正常運作
6. `flutter analyze` 無新增 errors/warnings
7. 所有現有測試通過

### 🔄 TDD 工作流程

#### Step 1.1: 為 `Collection` 撰寫測試 (🔴 Red)

**檔案**: `test/domain/models/collection_test.dart` (新建)

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:news_hub/domain/models/collection/collection.dart';
import 'package:news_hub/domain/models/collection/collection_board.dart';

void main() {
  group('Collection (Freezed)', () {
    test('應該是不可變的', () {
      final board1 = CollectionBoard(
        boardId: 'board1',
        extensionPkgName: 'ext1',
        boardName: 'Board 1',
      );

      final collection = Collection(
        id: 'col1',
        name: 'Test Collection',
        boards: [board1],
      );

      // ✅ 驗證：boards 應該是不可修改的
      expect(
        () => collection.boards.add(CollectionBoard(
          boardId: 'board2',
          extensionPkgName: 'ext2',
          boardName: 'Board 2',
        )),
        throwsUnsupportedError,
      );
    });

    test('應該提供 copyWith 方法', () {
      final original = Collection(
        id: 'col1',
        name: 'Original',
        boards: [],
      );

      final updated = original.copyWith(name: 'Updated');

      expect(updated.id, 'col1');
      expect(updated.name, 'Updated');
      expect(updated.boards, isEmpty);
      // ✅ 驗證：原物件未被修改
      expect(original.name, 'Original');
    });

    test('應該正確實作 == 和 hashCode', () {
      final col1 = Collection(id: 'col1', name: 'Test', boards: []);
      final col2 = Collection(id: 'col1', name: 'Test', boards: []);
      final col3 = Collection(id: 'col2', name: 'Test', boards: []);

      expect(col1, equals(col2));
      expect(col1.hashCode, equals(col2.hashCode));
      expect(col1, isNot(equals(col3)));
    });

    test('應該支援 JSON 序列化/反序列化', () {
      final collection = Collection(
        id: 'col1',
        name: 'Test',
        boards: [],
      );

      final json = collection.toJson();
      final restored = Collection.fromJson(json);

      expect(restored, equals(collection));
    });
  });
}
```

**執行測試** (應該失敗，因為 Collection 還是 plain class):
```bash
flutter test test/domain/models/collection_test.dart
```

#### Step 1.2: 遷移 `Collection` 至 Freezed (🟢 Green)

**檔案**: `lib/domain/models/collection/collection.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/collection/collection_board.dart';

part 'collection.freezed.dart';
part 'collection.g.dart';

@freezed
class Collection with _$Collection {
  const factory Collection({
    required String id,
    required String name,
    @Default([]) List<CollectionBoard> boards,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
}
```

**生成程式碼**:
```bash
dart run build_runner build --delete-conflicting-outputs
```

**執行測試** (應該通過):
```bash
flutter test test/domain/models/collection_test.dart
```

#### Step 1.3: 重構使用 Collection 的程式碼 (🔵 Refactor)

**檢查所有使用點**:
```bash
# 搜尋所有使用 Collection 的地方
rg "Collection\(" lib/ --type dart
```

**重構範例**:

```dart
// ❌ BEFORE (如果有手動建構 Collection 的地方)
final collection = Collection(
  id: id,
  name: name,
  boards: boards,
);

// ✅ AFTER (使用 freezed factory)
final collection = Collection(
  id: id,
  name: name,
  boards: boards,
);

// ❌ BEFORE (如果有手動更新的地方)
final updatedCollection = Collection(
  id: original.id,
  name: newName,
  boards: original.boards,
);

// ✅ AFTER (使用 copyWith)
final updatedCollection = original.copyWith(name: newName);
```

**執行完整測試套件**:
```bash
flutter test
flutter analyze
```

#### Step 1.4: 重複相同流程處理其他 Models

**處理順序** (依賴關係由下至上):
1. `CollectionBoard` (被 Collection 依賴)
2. `Collection`
3. `ExtensionMetadata` (被 Extension 依賴)
4. `Extension`
5. 其他 domain models

**每個 model 都要**:
- 撰寫 freezed 測試 (不可變性、copyWith、equality、JSON)
- 遷移至 freezed
- 生成程式碼
- 重構使用點
- 執行測試驗證

### 🔍 驗證步驟

**最終驗證清單**:

```bash
# 1. 確認所有測試通過
flutter test --coverage

# 2. 確認無靜態分析錯誤
flutter analyze

# 3. 確認所有 domain models 使用 freezed
rg "^class [A-Z]" lib/domain/models/ --type dart
# 應該只看到 freezed 生成的 _$ 類別

# 4. 確認所有 models 有對應的 .freezed.dart 和 .g.dart
find lib/domain/models -name "*.dart" ! -name "*.freezed.dart" ! -name "*.g.dart"

# 5. 手動測試 App 功能
# - 首頁載入 collections
# - 新增/編輯/刪除 collection
# - Extension 管理
```

### 📦 Commit 策略

每遷移一個 model 就 commit 一次：

```bash
git add .
git commit -m "refactor(domain): migrate Collection model to freezed

- Add freezed annotation to Collection
- Implement immutable boards list
- Add copyWith, equality, and JSON serialization
- Add comprehensive model tests
- Update all usage sites to use copyWith

BREAKING CHANGE: Collection is now immutable"
```

---

## Task 2: 補充 BLoC 測試覆蓋 - Phase 1 核心 BLoCs

### 📐 規格 (Specification)

**目標**: 為核心業務邏輯的 5 個 BLoCs 撰寫全面測試，達到 80%+ 覆蓋率。

**範圍** (Phase 1 優先處理):
1. `SearchFormCubit` - 複雜搜尋邏輯
2. `CollectionThreadListCubit` - 核心瀏覽功能
3. `CollectionFormCubit` - Collection 管理
4. `ExtensionCubit` - Extension 管理
5. `CollectionCubit` - Collection 操作

**為什麼需要**:
- 符合 CONTRIBUTING.md 的 80%+ 覆蓋率要求
- 為重構提供安全網
- 確保業務邏輯正確性
- 防止迴歸錯誤

### ✅ 驗收標準 (Acceptance Criteria)

1. 每個 BLoC/Cubit 有對應的 `_test.dart` 檔案
2. 測試覆蓋所有公開方法和關鍵業務邏輯
3. 測試覆蓋正常流程、錯誤流程、邊界情況
4. 使用 `bloc_test` package 的標準模式
5. 所有依賴都使用 mock (repository, use cases)
6. 每個 BLoC 測試覆蓋率 > 80%
7. 所有測試通過且執行時間 < 30 秒

### 🔄 TDD 工作流程

#### Step 2.1: SearchFormCubit 測試 (🔴 Red → 🟢 Green)

**檔案**: `test/presentation/components/forms/thread-search/bloc/search_form_cubit_test.dart` (新建)

```dart
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_hub/domain/bookmark/interactor/list_bookmarks.dart';
import 'package:news_hub/domain/collection/interactor/get_collections.dart';
import 'package:news_hub/presentation/components/forms/thread-search/bloc/search_form_cubit.dart';

import 'search_form_cubit_test.mocks.dart';

@GenerateMocks([GetCollections, ListBookmarks])
void main() {
  group('SearchFormCubit', () {
    late MockGetCollections mockGetCollections;
    late MockListBookmarks mockListBookmarks;
    late SearchFormCubit cubit;

    setUp(() {
      mockGetCollections = MockGetCollections();
      mockListBookmarks = MockListBookmarks();
      cubit = SearchFormCubit(
        getCollections: mockGetCollections,
        listBookmarks: mockListBookmarks,
      );
    });

    tearDown(() {
      cubit.close();
    });

    test('初始狀態應該正確', () {
      expect(cubit.state.query, isEmpty);
      expect(cubit.state.selectedCollectionId, isNull);
      expect(cubit.state.selectedBoardId, isNull);
      expect(cubit.state.searchIn, SearchIn.threads);
      expect(cubit.state.collections, isEmpty);
    });

    group('loadCollections', () {
      final testCollections = [
        Collection(id: 'col1', name: 'Collection 1', boards: []),
        Collection(id: 'col2', name: 'Collection 2', boards: []),
      ];

      blocTest<SearchFormCubit, SearchFormState>(
        '應該載入 collections 並更新狀態',
        build: () {
          when(mockGetCollections.execute())
              .thenAnswer((_) async => testCollections);
          return cubit;
        },
        act: (cubit) => cubit.loadCollections(),
        expect: () => [
          predicate<SearchFormState>(
            (state) => state.collections.length == 2,
          ),
        ],
        verify: (_) {
          verify(mockGetCollections.execute()).called(1);
        },
      );

      blocTest<SearchFormCubit, SearchFormState>(
        '當載入失敗時應該處理錯誤',
        build: () {
          when(mockGetCollections.execute())
              .thenThrow(Exception('Network error'));
          return cubit;
        },
        act: (cubit) => cubit.loadCollections(),
        expect: () => [
          // 根據實際錯誤處理邏輯調整
        ],
        errors: () => [isException],
      );
    });

    group('updateQuery', () {
      blocTest<SearchFormCubit, SearchFormState>(
        '應該更新搜尋 query',
        build: () => cubit,
        act: (cubit) => cubit.updateQuery('test query'),
        expect: () => [
          predicate<SearchFormState>(
            (state) => state.query == 'test query',
          ),
        ],
      );

      blocTest<SearchFormCubit, SearchFormState>(
        '應該 trim 空白字元',
        build: () => cubit,
        act: (cubit) => cubit.updateQuery('  test  '),
        expect: () => [
          predicate<SearchFormState>(
            (state) => state.query == 'test',
          ),
        ],
      );
    });

    group('selectCollection', () {
      blocTest<SearchFormCubit, SearchFormState>(
        '應該選擇 collection 並重置 board',
        build: () => cubit,
        seed: () => SearchFormState(
          selectedBoardId: 'oldBoard',
        ),
        act: (cubit) => cubit.selectCollection('col1'),
        expect: () => [
          predicate<SearchFormState>(
            (state) =>
                state.selectedCollectionId == 'col1' &&
                state.selectedBoardId == null,
          ),
        ],
      );
    });

    group('canSubmit', () {
      test('當 query 為空時應該返回 false', () {
        final state = SearchFormState(query: '');
        expect(cubit.canSubmit(state), isFalse);
      });

      test('當 query 不為空時應該返回 true', () {
        final state = SearchFormState(query: 'test');
        expect(cubit.canSubmit(state), isTrue);
      });

      test('當 searchIn 為 bookmarks 但 query 為空時應該返回 true', () {
        final state = SearchFormState(
          query: '',
          searchIn: SearchIn.bookmarks,
        );
        expect(cubit.canSubmit(state), isTrue);
      });
    });

    group('複雜場景測試', () {
      blocTest<SearchFormCubit, SearchFormState>(
        '應該正確處理完整的搜尋流程',
        build: () {
          when(mockGetCollections.execute()).thenAnswer(
            (_) async => [
              Collection(
                id: 'col1',
                name: 'Test',
                boards: [
                  CollectionBoard(
                    boardId: 'board1',
                    extensionPkgName: 'ext1',
                    boardName: 'Board 1',
                  ),
                ],
              ),
            ],
          );
          return cubit;
        },
        act: (cubit) async {
          await cubit.loadCollections();
          cubit.updateQuery('test search');
          cubit.selectCollection('col1');
          cubit.selectBoard('board1');
          cubit.setSearchIn(SearchIn.threads);
        },
        expect: () => [
          // Collections loaded
          predicate<SearchFormState>((s) => s.collections.isNotEmpty),
          // Query updated
          predicate<SearchFormState>((s) => s.query == 'test search'),
          // Collection selected, board reset
          predicate<SearchFormState>(
            (s) => s.selectedCollectionId == 'col1' && s.selectedBoardId == null,
          ),
          // Board selected
          predicate<SearchFormState>((s) => s.selectedBoardId == 'board1'),
          // SearchIn updated
          predicate<SearchFormState>((s) => s.searchIn == SearchIn.threads),
        ],
      );
    });
  });
}
```

**生成 Mocks**:
```bash
dart run build_runner build --delete-conflicting-outputs
```

**執行測試**:
```bash
flutter test test/presentation/components/forms/thread-search/bloc/search_form_cubit_test.dart
```

#### Step 2.2: 重複相同模式處理其他 BLoCs

**測試模板結構** (所有 BLoC 測試應遵循):

```dart
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// 1️⃣ 定義需要 mock 的依賴
@GenerateMocks([DependencyA, DependencyB])
void main() {
  group('XxxCubit', () {
    // 2️⃣ 宣告變數
    late MockDependencyA mockDependencyA;
    late XxxCubit cubit;

    // 3️⃣ 每個測試前設定
    setUp(() {
      mockDependencyA = MockDependencyA();
      cubit = XxxCubit(dependencyA: mockDependencyA);
    });

    // 4️⃣ 每個測試後清理
    tearDown(() {
      cubit.close();
    });

    // 5️⃣ 測試初始狀態
    test('初始狀態應該正確', () {
      expect(cubit.state.xxx, expectedValue);
    });

    // 6️⃣ 為每個公開方法寫測試組
    group('methodName', () {
      // ✅ 正常流程
      blocTest<XxxCubit, XxxState>(
        '應該成功執行 xxx',
        build: () {
          when(mockDependencyA.method()).thenAnswer((_) async => result);
          return cubit;
        },
        act: (cubit) => cubit.methodName(),
        expect: () => [expectedState],
        verify: (_) {
          verify(mockDependencyA.method()).called(1);
        },
      );

      // ❌ 錯誤流程
      blocTest<XxxCubit, XxxState>(
        '當發生錯誤時應該處理',
        build: () {
          when(mockDependencyA.method()).thenThrow(Exception('Error'));
          return cubit;
        },
        act: (cubit) => cubit.methodName(),
        errors: () => [isException],
      );

      // 🔍 邊界情況
      blocTest<XxxCubit, XxxState>(
        '當資料為空時應該正確處理',
        build: () {
          when(mockDependencyA.method()).thenAnswer((_) async => []);
          return cubit;
        },
        act: (cubit) => cubit.methodName(),
        expect: () => [emptyState],
      );
    });

    // 7️⃣ 複雜場景測試
    group('複雜場景測試', () {
      blocTest<XxxCubit, XxxState>(
        '應該正確處理連續操作',
        build: () => cubit,
        act: (cubit) async {
          await cubit.action1();
          await cubit.action2();
          cubit.action3();
        },
        expect: () => [state1, state2, state3],
      );
    });
  });
}
```

#### Step 2.3: CollectionThreadListCubit 測試範例

**重點測試項目**:
- 初始載入 threads
- 分頁載入 (loadMore)
- 下拉刷新 (refresh)
- 錯誤處理
- Loading 狀態管理

```dart
@GenerateMocks([ListBoardThreads])
void main() {
  group('CollectionThreadListCubit', () {
    late MockListBoardThreads mockListBoardThreads;
    late CollectionThreadListCubit cubit;

    final testBoards = [
      CollectionBoard(
        boardId: 'board1',
        extensionPkgName: 'ext1',
        boardName: 'Test Board',
      ),
    ];

    setUp(() {
      mockListBoardThreads = MockListBoardThreads();
      cubit = CollectionThreadListCubit(
        boards: testBoards,
        listBoardThreads: mockListBoardThreads,
      );
    });

    tearDown(() {
      cubit.close();
    });

    group('loadInitial', () {
      final testThreads = [
        Thread(id: '1', title: 'Thread 1'),
        Thread(id: '2', title: 'Thread 2'),
      ];

      blocTest<CollectionThreadListCubit, CollectionThreadListState>(
        '應該載入初始 threads',
        build: () {
          when(mockListBoardThreads.execute(any, page: anyNamed('page')))
              .thenAnswer((_) async => testThreads);
          return cubit;
        },
        act: (cubit) => cubit.loadInitial(),
        expect: () => [
          // Loading state
          predicate<CollectionThreadListState>((s) => s.isLoading),
          // Loaded state
          predicate<CollectionThreadListState>(
            (s) => !s.isLoading && s.threads.length == 2,
          ),
        ],
        verify: (_) {
          verify(mockListBoardThreads.execute('board1', page: 1)).called(1);
        },
      );

      blocTest<CollectionThreadListCubit, CollectionThreadListState>(
        '當載入失敗時應該設定錯誤狀態',
        build: () {
          when(mockListBoardThreads.execute(any, page: anyNamed('page')))
              .thenThrow(Exception('Network error'));
          return cubit;
        },
        act: (cubit) => cubit.loadInitial(),
        expect: () => [
          predicate<CollectionThreadListState>((s) => s.isLoading),
          predicate<CollectionThreadListState>(
            (s) => !s.isLoading && s.hasError,
          ),
        ],
      );
    });

    group('loadMore', () {
      blocTest<CollectionThreadListCubit, CollectionThreadListState>(
        '應該載入下一頁',
        build: () {
          when(mockListBoardThreads.execute(any, page: 1))
              .thenAnswer((_) async => [Thread(id: '1', title: 'T1')]);
          when(mockListBoardThreads.execute(any, page: 2))
              .thenAnswer((_) async => [Thread(id: '2', title: 'T2')]);
          return cubit;
        },
        act: (cubit) async {
          await cubit.loadInitial();
          await cubit.loadMore();
        },
        expect: () => [
          // Initial load - loading
          predicate<CollectionThreadListState>((s) => s.isLoading),
          // Initial load - loaded
          predicate<CollectionThreadListState>((s) => s.threads.length == 1),
          // Load more - loading
          predicate<CollectionThreadListState>((s) => s.isLoadingMore),
          // Load more - loaded
          predicate<CollectionThreadListState>(
            (s) => s.threads.length == 2 && !s.isLoadingMore,
          ),
        ],
      );

      blocTest<CollectionThreadListCubit, CollectionThreadListState>(
        '當已經在載入時不應該重複載入',
        build: () => cubit,
        seed: () => CollectionThreadListState(isLoadingMore: true),
        act: (cubit) => cubit.loadMore(),
        expect: () => [],
      );
    });
  });
}
```

### 🔍 驗證步驟

**Phase 1 完成驗證**:

```bash
# 1. 執行所有新增的測試
flutter test test/presentation/components/forms/thread-search/
flutter test test/presentation/pages/collection/:collectionId/threads/list/cubit/
flutter test test/presentation/pages/collection/form/cubit/
flutter test test/presentation/pages/extension/extension_cubit_test.dart
flutter test test/presentation/pages/home/collection_cubit_test.dart

# 2. 檢查測試覆蓋率
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
# 開啟 coverage/html/index.html 檢查各 BLoC 覆蓋率

# 3. 確認所有測試通過
flutter test

# 4. 確認測試執行時間合理
# 所有 BLoC 測試總時間應 < 30 秒
```

**覆蓋率檢查清單**:
- [ ] SearchFormCubit: > 80%
- [ ] CollectionThreadListCubit: > 80%
- [ ] CollectionFormCubit: > 80%
- [ ] ExtensionCubit: > 80%
- [ ] CollectionCubit: > 80%

### 📦 Commit 策略

每完成一個 BLoC 測試就 commit：

```bash
git add test/presentation/components/forms/thread-search/
git commit -m "test(presentation): add comprehensive tests for SearchFormCubit

- Test initial state and loadCollections
- Test query update and validation
- Test collection/board selection logic
- Test searchIn toggle functionality
- Test complex search flow scenarios
- Mock GetCollections and ListBookmarks dependencies
- Achieve 85% coverage for SearchFormCubit

Part of BLoC testing coverage improvement (Task 2, Phase 1)"
```

---

## Task 3: 移除過時 API

### 📐 規格 (Specification)

**目標**: 移除所有使用 deprecated API 的程式碼，使用推薦的替代方案。

**範圍**:
- `ExpansionTileController` → 推薦替代方案 (待確認)

**為什麼需要**:
- 避免未來 Flutter 版本移除過時 API 導致編譯錯誤
- 使用最新、效能更好的 API
- 符合 Flutter 最佳實踐

### ✅ 驗收標準 (Acceptance Criteria)

1. 所有 deprecated API 使用已移除
2. 替代實作功能等同或更好
3. `flutter analyze` 不顯示 deprecation warnings
4. 相關功能測試通過
5. UI 行為保持一致

### 🔄 TDD 工作流程

#### Step 3.1: 撰寫 Widget 測試 (🔴 Red)

**檔案**: `test/presentation/components/navigation/app_navigation_drawer_test.dart` (新建)

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_hub/presentation/components/navigation/app_navigation_drawer.dart';

void main() {
  group('AppNavigationDrawer', () {
    testWidgets('應該展開和收合 collection', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            drawer: AppNavigationDrawer(
              collections: [
                Collection(
                  id: 'col1',
                  name: 'Test Collection',
                  boards: [
                    CollectionBoard(
                      boardId: 'board1',
                      extensionPkgName: 'ext1',
                      boardName: 'Board 1',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      // 初始狀態應該是收合的
      expect(find.text('Board 1'), findsNothing);

      // 點擊展開
      await tester.tap(find.text('Test Collection'));
      await tester.pumpAndSettle();

      // 應該顯示 boards
      expect(find.text('Board 1'), findsOneWidget);

      // 再次點擊收合
      await tester.tap(find.text('Test Collection'));
      await tester.pumpAndSettle();

      // 應該隱藏 boards
      expect(find.text('Board 1'), findsNothing);
    });

    testWidgets('應該記住展開狀態', (tester) async {
      // 測試展開狀態在 widget rebuild 後保持
      // ...
    });
  });
}
```

#### Step 3.2: 研究替代方案並實作 (🟢 Green)

**調查 ExpansionTileController 的替代方案**:

1. 查看 Flutter 文件
2. 檢查 ExpansionTile 新版本的推薦用法
3. 可能的替代方案：
   - 使用 stateful widget 管理展開狀態
   - 使用 ExpansionPanelList
   - 使用自訂實作

**實作範例** (假設使用 stateful widget):

```dart
// lib/presentation/components/navigation/app_navigation_drawer.dart

class AppNavigationDrawer extends StatefulWidget {
  final List<Collection> collections;
  final String? expandedCollectionId;
  final Function(String collectionId)? onCollectionTap;

  const AppNavigationDrawer({
    Key? key,
    required this.collections,
    this.expandedCollectionId,
    this.onCollectionTap,
  }) : super(key: key);

  @override
  State<AppNavigationDrawer> createState() => _AppNavigationDrawerState();
}

class _AppNavigationDrawerState extends State<AppNavigationDrawer> {
  late String? _expandedCollectionId;

  @override
  void initState() {
    super.initState();
    _expandedCollectionId = widget.expandedCollectionId;
  }

  @override
  void didUpdateWidget(AppNavigationDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expandedCollectionId != oldWidget.expandedCollectionId) {
      _expandedCollectionId = widget.expandedCollectionId;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Drawer header
          const DrawerHeader(
            child: Text('News Hub'),
          ),

          // Collections
          ...widget.collections.map((collection) {
            final isExpanded = _expandedCollectionId == collection.id;

            return ExpansionTile(
              key: ValueKey(collection.id),
              title: Text(collection.name),
              initiallyExpanded: isExpanded,
              onExpansionChanged: (expanded) {
                setState(() {
                  _expandedCollectionId = expanded ? collection.id : null;
                });
                if (expanded && widget.onCollectionTap != null) {
                  widget.onCollectionTap!(collection.id);
                }
              },
              children: collection.boards.map((board) {
                return ListTile(
                  title: Text(board.boardName),
                  onTap: () {
                    // Navigate to board
                  },
                );
              }).toList(),
            );
          }).toList(),
        ],
      ),
    );
  }
}
```

#### Step 3.3: 驗證並重構 (🔵 Refactor)

```bash
# 執行測試
flutter test test/presentation/components/navigation/app_navigation_drawer_test.dart

# 檢查無 deprecation warnings
flutter analyze

# 手動測試 UI 行為
flutter run
```

### 🔍 驗證步驟

```bash
# 1. 搜尋是否還有 ExpansionTileController 使用
rg "ExpansionTileController" lib/ --type dart
# 應該返回 0 結果

# 2. 檢查 deprecation warnings
flutter analyze | grep -i "deprecated"
# 應該沒有輸出

# 3. 執行完整測試
flutter test

# 4. 手動測試受影響的 UI
# - 開啟導航抽屜
# - 展開/收合 collections
# - 切換不同 collections
# - 重啟 app 檢查狀態保持
```

### 📦 Commit 策略

```bash
git add lib/presentation/components/navigation/
git add test/presentation/components/navigation/
git commit -m "refactor(ui): remove deprecated ExpansionTileController

- Replace ExpansionTileController with stateful widget approach
- Manage expansion state in component state
- Add widget tests for expansion behavior
- Remove all deprecation warnings

Fixes deprecation warning at app_navigation_drawer.dart:112"
```

---

## Task 4: BLoC 效能優化

### 📐 規格 (Specification)

**目標**: 優化 BLoC 重建次數，減少不必要的 widget 重建 > 80%。

**範圍**:
- `lib/presentation/pages/home/home_screen.dart`
- `lib/presentation/pages/collection/:collectionId/threads/list/collection_thread_list_screen.dart`
- `lib/presentation/pages/thread/detail/view/thread_detail_screen.dart`
- 其他使用 `BlocBuilder` 的頁面

**為什麼需要**:
- 符合 CONTRIBUTING.md 的效能要求
- 提升 app 流暢度
- 降低電池消耗

### ✅ 驗收標準 (Acceptance Criteria)

1. 使用 `BlocSelector` 替代 `BlocBuilder` 精確訂閱
2. 添加 `buildWhen` 條件過濾不必要的重建
3. 單次狀態更新僅觸發相關 widget 重建
4. AppBar、BottomNavigationBar 等無關組件不重建
5. 測量並記錄優化前後重建次數對比
6. 重建次數減少 > 80%
7. 所有功能正常運作

### 🔄 TDD 工作流程

#### Step 4.1: 測量優化前基準 (Baseline)

**創建測量工具**:

```dart
// test/helpers/rebuild_counter.dart

import 'package:flutter/material.dart';

class RebuildCounter extends StatelessWidget {
  static int count = 0;
  final String name;
  final Widget child;

  const RebuildCounter({
    Key? key,
    required this.name,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    count++;
    debugPrint('🔄 [$name] Rebuild #$count');
    return child;
  }
}

void resetRebuildCounter() {
  RebuildCounter.count = 0;
}
```

**測量腳本**:

```dart
// test/performance/home_screen_rebuild_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/presentation/pages/home/home_screen.dart';
import 'package:news_hub/presentation/pages/home/home_cubit.dart';

import '../helpers/rebuild_counter.dart';

void main() {
  group('HomeScreen Rebuild Performance', () {
    testWidgets('測量 collections 更新時的重建次數', (tester) async {
      final cubit = HomeCubit(/* mocked dependencies */);
      resetRebuildCounter();

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: cubit,
            child: RebuildCounter(
              name: 'HomeScreen',
              child: const HomeScreen(),
            ),
          ),
        ),
      );

      // 記錄初始重建次數
      final initialRebuildCount = RebuildCounter.count;
      resetRebuildCounter();

      // 觸發狀態更新（僅 collections 改變）
      cubit.loadCollections();
      await tester.pumpAndSettle();

      final afterLoadCount = RebuildCounter.count;

      // 記錄結果
      debugPrint('📊 Baseline Results:');
      debugPrint('   Initial builds: $initialRebuildCount');
      debugPrint('   After load: $afterLoadCount');

      // 建立基準
      expect(afterLoadCount, greaterThan(0));
    });
  });
}
```

**執行基準測試**:
```bash
flutter test test/performance/home_screen_rebuild_test.dart --plain-name="測量"
```

#### Step 4.2: 優化 HomeScreen (🔴 Red → 🟢 Green)

**優化前** (`lib/presentation/pages/home/home_screen.dart`):

```dart
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        // ❌ 整個 Scaffold 都會在任何 state 變化時重建
        return Scaffold(
          appBar: AppBar(
            title: const Text('News Hub'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => context.router.push(const SearchRoute()),
              ),
            ],
          ),
          drawer: AppNavigationDrawer(
            collections: state.collections,
            expandedCollectionId: state.expandedCollectionId,
          ),
          body: _buildBody(state),
        );
      },
    );
  }
}
```

**優化後**:

```dart
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ AppBar 不再重建 (除非整個 HomeScreen 被替換)
      appBar: AppBar(
        title: const Text('News Hub'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.router.push(const SearchRoute()),
          ),
        ],
      ),
      // ✅ 使用 BlocSelector 精確訂閱 collections
      drawer: BlocSelector<HomeCubit, HomeState, (List<Collection>, String?)>(
        selector: (state) => (state.collections, state.expandedCollectionId),
        builder: (context, data) {
          final (collections, expandedId) = data;
          return AppNavigationDrawer(
            collections: collections,
            expandedCollectionId: expandedId,
          );
        },
      ),
      // ✅ Body 部分使用 BlocBuilder，但添加 buildWhen
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) {
          // 只在 collections 真正改變時重建
          return previous.collections != current.collections ||
                 previous.isLoading != current.isLoading ||
                 previous.error != current.error;
        },
        builder: (context, state) => _buildBody(state),
      ),
    );
  }

  Widget _buildBody(HomeState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(child: Text('Error: ${state.error}'));
    }

    return ListView.builder(
      itemCount: state.collections.length,
      itemBuilder: (context, index) {
        final collection = state.collections[index];
        return ListTile(
          title: Text(collection.name),
          onTap: () => context.router.push(
            CollectionRoute(collectionId: collection.id),
          ),
        );
      },
    );
  }
}
```

#### Step 4.3: 測量優化後效果並撰寫驗證測試

```dart
// test/performance/home_screen_rebuild_test.dart (更新)

testWidgets('優化後：collections 更新時重建次數應減少 > 80%', (tester) async {
  final cubit = HomeCubit(/* ... */);

  // 測量優化後
  resetRebuildCounter();
  await tester.pumpWidget(/* optimized HomeScreen */);

  cubit.loadCollections();
  await tester.pumpAndSettle();

  final optimizedCount = RebuildCounter.count;

  debugPrint('📊 Optimization Results:');
  debugPrint('   Before: $baselineCount rebuilds');
  debugPrint('   After: $optimizedCount rebuilds');
  debugPrint('   Reduction: ${((baselineCount - optimizedCount) / baselineCount * 100).toStringAsFixed(1)}%');

  // ✅ 驗證減少 > 80%
  expect(
    optimizedCount,
    lessThan(baselineCount * 0.2), // 少於原本的 20% = 減少 > 80%
  );
});

testWidgets('優化後：AppBar 在 collections 更新時不應重建', (tester) async {
  // 使用 RebuildCounter 包裝 AppBar
  // 驗證 AppBar 重建次數 = 0
});
```

#### Step 4.4: 重複優化其他頁面

**優化模式彙總**:

1. **分離靜態和動態部分**:
   ```dart
   // ❌ BAD
   BlocBuilder(
     builder: (context, state) => Scaffold(
       appBar: AppBar(...), // 靜態部分也會重建
       body: DynamicContent(state),
     ),
   )

   // ✅ GOOD
   Scaffold(
     appBar: AppBar(...), // 靜態，不重建
     body: BlocBuilder(
       builder: (context, state) => DynamicContent(state),
     ),
   )
   ```

2. **使用 BlocSelector 精確訂閱**:
   ```dart
   // ❌ BAD: 訂閱整個 state
   BlocBuilder<ThreadDetailCubit, ThreadDetailState>(
     builder: (context, state) => Text(state.post.title),
   )

   // ✅ GOOD: 只訂閱需要的欄位
   BlocSelector<ThreadDetailCubit, ThreadDetailState, String>(
     selector: (state) => state.post.title,
     builder: (context, title) => Text(title),
   )
   ```

3. **添加 buildWhen 條件**:
   ```dart
   BlocBuilder<XxxCubit, XxxState>(
     buildWhen: (previous, current) {
       // 只在相關欄位改變時重建
       return previous.relevantField != current.relevantField;
     },
     builder: (context, state) => ...,
   )
   ```

### 🔍 驗證步驟

**建立效能報告**:

```markdown
# 效能優化報告

## HomeScreen

### 優化前
- 初始 render: 45 builds
- Collections 更新: 38 builds
- Drawer 展開: 22 builds

### 優化後
- 初始 render: 12 builds (-73%)
- Collections 更新: 5 builds (-87%) ✅
- Drawer 展開: 3 builds (-86%) ✅

### 優化措施
1. AppBar 移出 BlocBuilder
2. Drawer 使用 BlocSelector
3. Body 添加 buildWhen 條件

## CollectionThreadListScreen

### 優化前
- Thread 載入: 52 builds
- 下一頁: 28 builds

### 優化後
- Thread 載入: 8 builds (-85%) ✅
- 下一頁: 4 builds (-86%) ✅

### 優化措施
1. AppBar 靜態化
2. Thread list 使用 BlocSelector 訂閱 threads
3. Loading indicator 使用 BlocSelector 訂閱 isLoading
```

### 📦 Commit 策略

```bash
git add lib/presentation/pages/home/
git add test/performance/
git commit -m "perf(presentation): optimize HomeScreen rebuild performance

- Move static AppBar out of BlocBuilder
- Use BlocSelector for precise state subscription in Drawer
- Add buildWhen condition to body BlocBuilder
- Reduce rebuilds by 87% on collections update (38 → 5 builds)
- Add performance measurement tests

Performance improvements:
- Initial render: 45 → 12 builds (-73%)
- Collections update: 38 → 5 builds (-87%)
- Drawer expansion: 22 → 3 builds (-86%)

Part of BLoC performance optimization (Task 4)"
```

---

## Task 5: 清理測試程式碼 Warnings

### 📐 規格 (Specification)

**目標**: 修復所有測試檔案中的靜態分析 warnings。

**範圍**:
- 18 處缺少 `const` 關鍵字
- 1 個未使用的變數 (`tPostWithExt`)
- 1 個未使用的 import
- `widget_test.dart` 範例檔案

**為什麼需要**:
- 保持程式碼品質一致性
- 避免誤導性的範例測試
- 符合 linter 規範

### ✅ 驗收標準 (Acceptance Criteria)

1. `flutter analyze` 顯示 0 info
2. 所有測試檔案符合 `prefer_const_constructors` 規則
3. 無未使用的變數或 imports
4. `widget_test.dart` 已移除或更新為實際測試

### 🔄 工作流程

#### Step 5.1: 自動修復 const 問題

```bash
# 使用 dart fix 自動修復
dart fix --apply

# 手動檢查修復結果
flutter analyze
```

#### Step 5.2: 清理未使用的變數和 imports

**手動修復範例**:

```dart
// test/domain/thread/interactor/get_original_post_test.dart

// ❌ BEFORE
import 'package:news_hub/domain/thread/model/post.dart';  // 未使用
// ...
final tPostWithExt = PostWithExt(/* ... */);  // 未使用

// ✅ AFTER
// import 已移除
// tPostWithExt 已移除或使用
```

#### Step 5.3: 處理 widget_test.dart

```bash
# 選項 1: 直接刪除
rm test/widget_test.dart

# 選項 2: 更新為實際的整合測試 (如果需要)
# 修改 test/widget_test.dart 為實際的 app 整合測試
```

### 🔍 驗證步驟

```bash
# 執行靜態分析
flutter analyze

# 應該顯示：
# Analyzing news_hub...
# No issues found!

# 執行測試確保修改後仍通過
flutter test
```

### 📦 Commit 策略

```bash
git add test/
git rm test/widget_test.dart
git commit -m "test: clean up test file warnings and unused code

- Apply dart fix for prefer_const_constructors (18 fixes)
- Remove unused variable tPostWithExt
- Remove unused import in get_original_post_test.dart
- Delete example widget_test.dart file

flutter analyze now shows 0 issues (previously 19 info + 1 warning)"
```

---

## 📊 整體進度追蹤

### 進度檢查清單

```markdown
## 階段一：基礎架構改進

- [ ] Task 1: Domain Models 遷移至 Freezed
  - [ ] CollectionBoard
  - [ ] Collection
  - [ ] ExtensionMetadata
  - [ ] Extension
  - [ ] 其他 models
  - [ ] 完整測試驗證

- [ ] Task 2: BLoC 測試覆蓋 - Phase 1
  - [ ] SearchFormCubit (> 80%)
  - [ ] CollectionThreadListCubit (> 80%)
  - [ ] CollectionFormCubit (> 80%)
  - [ ] ExtensionCubit (> 80%)
  - [ ] CollectionCubit (> 80%)

- [ ] Task 3: 移除過時 API
  - [ ] ExpansionTileController 替換
  - [ ] Widget 測試
  - [ ] 手動驗證

## 階段二：效能與品質優化

- [ ] Task 4: BLoC 效能優化
  - [ ] HomeScreen (> 80% 減少)
  - [ ] CollectionThreadListScreen (> 80% 減少)
  - [ ] ThreadDetailScreen (> 80% 減少)
  - [ ] 效能測試與報告

- [ ] Task 5: 清理測試 Warnings
  - [ ] dart fix --apply
  - [ ] 清理未使用程式碼
  - [ ] 移除 widget_test.dart

## 階段三：完整測試覆蓋

- [ ] Task 6: BLoC 測試覆蓋 - Phase 2
  - [ ] 其餘 5+ BLoCs
  - [ ] 整體覆蓋率 > 80%
```

### 每日/每週檢查點

**每完成一個 Task**:
1. 執行 `flutter analyze` - 確認 0 errors/warnings
2. 執行 `flutter test` - 確認所有測試通過
3. 執行 `flutter test --coverage` - 檢查覆蓋率進度
4. 手動測試相關功能
5. Git commit 使用規範的 commit message

**每完成一個階段**:
1. 生成測試覆蓋率報告
2. 手動全面測試 app 功能
3. 更新 CODE_QUALITY_REPORT.md 進度
4. 在 PR 中記錄改進指標

---

## 🎓 AI Agent 執行指南

### 開始執行前

1. **閱讀相關文件**:
   - [ ] 已閱讀 CODE_QUALITY_REPORT.md
   - [ ] 已閱讀 CONTRIBUTING.md
   - [ ] 已閱讀 docs/AGENTS.md

2. **環境準備**:
   ```bash
   flutter doctor
   flutter pub get
   dart run build_runner build
   ```

3. **建立分支**:
   ```bash
   git checkout -b refactor/domain-models-freezed  # Task 1
   # 或
   git checkout -b test/bloc-coverage-phase1      # Task 2
   ```

### 執行時遵循

1. **嚴格遵循 TDD 循環**:
   - 🔴 先寫失敗的測試
   - 🟢 寫最少程式碼讓測試通過
   - 🔵 重構並保持測試通過

2. **小步前進**:
   - 每完成一個小單元就 commit
   - Commit message 遵循 Angular Convention
   - 使用正確的 scope

3. **持續驗證**:
   - 每次修改後執行 `flutter analyze`
   - 每次修改後執行相關測試
   - 定期執行完整測試套件

4. **遇到問題時**:
   - 記錄問題和解決方案
   - 更新相關文件
   - 在 commit message 中說明

### 完成後檢查

1. **程式碼品質**:
   - [ ] `flutter analyze` 顯示 0 issues
   - [ ] 所有測試通過
   - [ ] 測試覆蓋率達標

2. **文件更新**:
   - [ ] 如有架構變更，更新 README.md 或 DEVELOPMENT.md
   - [ ] 複雜邏輯添加必要註解
   - [ ] 更新 CODE_QUALITY_REPORT.md 進度

3. **提交 PR**:
   - 使用 PR 模板
   - 說明改進指標（測試覆蓋率、效能提升等）
   - 附上測試結果截圖或日誌

---

## 📚 參考資源

### 測試相關

- [bloc_test package](https://pub.dev/packages/bloc_test)
- [mockito package](https://pub.dev/packages/mockito)
- [Flutter Testing Guide](https://docs.flutter.dev/testing)

### Freezed 相關

- [freezed package](https://pub.dev/packages/freezed)
- [Freezed Code Generation](https://pub.dev/packages/freezed#code-generation)

### 效能優化

- [Flutter Performance Best Practices](https://docs.flutter.dev/perf/best-practices)
- [BLoC Performance Tips](https://bloclibrary.dev/#/architecture?id=performance)

### 本專案文件

- [CODE_QUALITY_REPORT.md](./CODE_QUALITY_REPORT.md) - 品質分析報告
- [CONTRIBUTING.md](../CONTRIBUTING.md) - 貢獻指南
- [DEVELOPMENT.md](./DEVELOPMENT.md) - 開發指南
- [AGENTS.md](./AGENTS.md) - AI 開發規範

---

**文件結束 - 開始重構之旅！🚀**
