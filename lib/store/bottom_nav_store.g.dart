// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_nav_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BottomNavStore on BottomNavStoreBase, Store {
  late final _$currentIndexAtom =
      Atom(name: 'BottomNavStoreBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$BottomNavStoreBaseActionController =
      ActionController(name: 'BottomNavStoreBase', context: context);

  @override
  void setIndex(int index) {
    final _$actionInfo = _$BottomNavStoreBaseActionController.startAction(
        name: 'BottomNavStoreBase.setIndex');
    try {
      return super.setIndex(index);
    } finally {
      _$BottomNavStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
