// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_extension_repo_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddExtensionRepoFormCWProxy {
  AddExtensionRepoForm indexUrl(String? indexUrl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddExtensionRepoForm(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddExtensionRepoForm(...).copyWith(id: 12, name: "My name")
  /// ````
  AddExtensionRepoForm call({
    String? indexUrl,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddExtensionRepoForm.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddExtensionRepoForm.copyWith.fieldName(...)`
class _$AddExtensionRepoFormCWProxyImpl
    implements _$AddExtensionRepoFormCWProxy {
  const _$AddExtensionRepoFormCWProxyImpl(this._value);

  final AddExtensionRepoForm _value;

  @override
  AddExtensionRepoForm indexUrl(String? indexUrl) => this(indexUrl: indexUrl);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddExtensionRepoForm(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddExtensionRepoForm(...).copyWith(id: 12, name: "My name")
  /// ````
  AddExtensionRepoForm call({
    Object? indexUrl = const $CopyWithPlaceholder(),
  }) {
    return AddExtensionRepoForm(
      indexUrl: indexUrl == const $CopyWithPlaceholder()
          ? _value.indexUrl
          // ignore: cast_nullable_to_non_nullable
          : indexUrl as String?,
    );
  }
}

extension $AddExtensionRepoFormCopyWith on AddExtensionRepoForm {
  /// Returns a callable class that can be used as follows: `instanceOfAddExtensionRepoForm.copyWith(...)` or like so:`instanceOfAddExtensionRepoForm.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddExtensionRepoFormCWProxy get copyWith =>
      _$AddExtensionRepoFormCWProxyImpl(this);
}

abstract class _$AddExtensionRepoStateCWProxy {
  AddExtensionRepoState form(AddExtensionRepoForm form);

  AddExtensionRepoState remoteRepo(StateStatus<ExtensionRepo> remoteRepo);

  AddExtensionRepoState addResult(StateStatus<void> addResult);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddExtensionRepoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddExtensionRepoState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddExtensionRepoState call({
    AddExtensionRepoForm form,
    StateStatus<ExtensionRepo> remoteRepo,
    StateStatus<void> addResult,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddExtensionRepoState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddExtensionRepoState.copyWith.fieldName(...)`
class _$AddExtensionRepoStateCWProxyImpl
    implements _$AddExtensionRepoStateCWProxy {
  const _$AddExtensionRepoStateCWProxyImpl(this._value);

  final AddExtensionRepoState _value;

  @override
  AddExtensionRepoState form(AddExtensionRepoForm form) => this(form: form);

  @override
  AddExtensionRepoState remoteRepo(StateStatus<ExtensionRepo> remoteRepo) =>
      this(remoteRepo: remoteRepo);

  @override
  AddExtensionRepoState addResult(StateStatus<void> addResult) =>
      this(addResult: addResult);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddExtensionRepoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddExtensionRepoState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddExtensionRepoState call({
    Object? form = const $CopyWithPlaceholder(),
    Object? remoteRepo = const $CopyWithPlaceholder(),
    Object? addResult = const $CopyWithPlaceholder(),
  }) {
    return AddExtensionRepoState(
      form: form == const $CopyWithPlaceholder()
          ? _value.form
          // ignore: cast_nullable_to_non_nullable
          : form as AddExtensionRepoForm,
      remoteRepo: remoteRepo == const $CopyWithPlaceholder()
          ? _value.remoteRepo
          // ignore: cast_nullable_to_non_nullable
          : remoteRepo as StateStatus<ExtensionRepo>,
      addResult: addResult == const $CopyWithPlaceholder()
          ? _value.addResult
          // ignore: cast_nullable_to_non_nullable
          : addResult as StateStatus<void>,
    );
  }
}

extension $AddExtensionRepoStateCopyWith on AddExtensionRepoState {
  /// Returns a callable class that can be used as follows: `instanceOfAddExtensionRepoState.copyWith(...)` or like so:`instanceOfAddExtensionRepoState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddExtensionRepoStateCWProxy get copyWith =>
      _$AddExtensionRepoStateCWProxyImpl(this);
}
