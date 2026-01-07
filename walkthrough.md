# Collection List Features Walkthrough

## Overview

Implemented comprehensive features for the Collection List, including creating, editing, deleting, and sorting collections. Refactored the architecture to use Cubits and updated the database schema.

## Key Changes

### 1. Database & Repository

- **Schema Update**: Added `sortOrder` column to `Collections` table (v4 migration).
- **Repository**: Implemented `reorder` method and updated `watchList` to sort by `sortOrder`.

### 2. State Management (Refactoring)

- **CollectionListCubit**: Refactored from Bloc to Cubit.
  - Added `reorderCollections` for drag-and-drop sorting.
  - Added `deleteCollection` with subscription management.
- **CollectionFormCubit**: Renamed from `CreateCollectionCubit`.
  - Added `init` method to support "Edit Mode" (pre-filling data).
  - Updated `submit` logic to handle both create and update operations.

### 3. UI Implementation

- **CollectionListScreen**:
  - Implemented `ReorderableListView` for drag-and-drop sorting.
  - Added Floating Action Button (FAB) for creating collections.
  - Added Context Menu (Edit/Delete) for each list item.
  - Added Delete Confirmation Dialog.
- **CollectionFormScreen**:
  - Renamed from `CreateCollectionPage`.
  - Updated title and button text based on mode (Create vs Edit).
  - Pre-fills data when editing.

### 4. Integration

- **AppNavigationDrawer**: Updated to use `CollectionListCubit` for reactive updates to the side menu.
- **HomeScreen**: Updated dependency injection to provide `CollectionListCubit`.
- **Router**: Updated routing configuration to use `CollectionFormRoute`.

## Verification Results

- **Sorting**: Collections are ordered by `sortOrder` in both the main list and the navigation drawer.
- **Persistence**: Reordering persists across app restarts.
- **Reactive Updates**:
  - creating a collection immediately shows it in the drawer.
  - deleting a collection removes it from both views.
  - renaming a collection updates the name everywhere.
- **Edit Flow**: Tapping "Edit" opens the form with existing data; saving updates the record correctly.

## Screenshots

(Placeholder for screenshots of the Reorderable List and Edit Form)
