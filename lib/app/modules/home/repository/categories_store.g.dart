// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriesStore on _CategoriesStoreBase, Store {
  late final _$categoriesAtom =
      Atom(name: '_CategoriesStoreBase.categories', context: context);

  @override
  ObservableList<String>? get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<String>? value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$loadCategoriesAsyncAction =
      AsyncAction('_CategoriesStoreBase.loadCategories', context: context);

  @override
  Future<void> loadCategories() {
    return _$loadCategoriesAsyncAction.run(() => super.loadCategories());
  }

  @override
  String toString() {
    return '''
categories: ${categories}
    ''';
  }
}
