// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookmarkStore on BookmarkStoreBase, Store {
  late final _$bookmarksAtom =
      Atom(name: 'BookmarkStoreBase.bookmarks', context: context);

  @override
  ObservableList<Map<String, String>> get bookmarks {
    _$bookmarksAtom.reportRead();
    return super.bookmarks;
  }

  @override
  set bookmarks(ObservableList<Map<String, String>> value) {
    _$bookmarksAtom.reportWrite(value, super.bookmarks, () {
      super.bookmarks = value;
    });
  }

  late final _$BookmarkStoreBaseActionController =
      ActionController(name: 'BookmarkStoreBase', context: context);

  @override
  void removeBookmark(int index) {
    final _$actionInfo = _$BookmarkStoreBaseActionController.startAction(
        name: 'BookmarkStoreBase.removeBookmark');
    try {
      return super.removeBookmark(index);
    } finally {
      _$BookmarkStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addBookmark(Map<String, String> bookmark) {
    final _$actionInfo = _$BookmarkStoreBaseActionController.startAction(
        name: 'BookmarkStoreBase.addBookmark');
    try {
      return super.addBookmark(bookmark);
    } finally {
      _$BookmarkStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bookmarks: ${bookmarks}
    ''';
  }
}
