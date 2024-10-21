// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CampaignStore on CampaignStoreBase, Store {
  late final _$progressAtom =
      Atom(name: 'CampaignStoreBase.progress', context: context);

  @override
  double get progress {
    _$progressAtom.reportRead();
    return super.progress;
  }

  @override
  set progress(double value) {
    _$progressAtom.reportWrite(value, super.progress, () {
      super.progress = value;
    });
  }

  late final _$raisedSoFarAtom =
      Atom(name: 'CampaignStoreBase.raisedSoFar', context: context);

  @override
  double get raisedSoFar {
    _$raisedSoFarAtom.reportRead();
    return super.raisedSoFar;
  }

  @override
  set raisedSoFar(double value) {
    _$raisedSoFarAtom.reportWrite(value, super.raisedSoFar, () {
      super.raisedSoFar = value;
    });
  }

  late final _$daysLeftAtom =
      Atom(name: 'CampaignStoreBase.daysLeft', context: context);

  @override
  String get daysLeft {
    _$daysLeftAtom.reportRead();
    return super.daysLeft;
  }

  @override
  set daysLeft(String value) {
    _$daysLeftAtom.reportWrite(value, super.daysLeft, () {
      super.daysLeft = value;
    });
  }

  late final _$isExpandedAtom =
      Atom(name: 'CampaignStoreBase.isExpanded', context: context);

  @override
  bool get isExpanded {
    _$isExpandedAtom.reportRead();
    return super.isExpanded;
  }

  @override
  set isExpanded(bool value) {
    _$isExpandedAtom.reportWrite(value, super.isExpanded, () {
      super.isExpanded = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: 'CampaignStoreBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$CampaignStoreBaseActionController =
      ActionController(name: 'CampaignStoreBase', context: context);

  @override
  void selectCategory(int index) {
    final _$actionInfo = _$CampaignStoreBaseActionController.startAction(
        name: 'CampaignStoreBase.selectCategory');
    try {
      return super.selectCategory(index);
    } finally {
      _$CampaignStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateProgress(double value) {
    final _$actionInfo = _$CampaignStoreBaseActionController.startAction(
        name: 'CampaignStoreBase.updateProgress');
    try {
      return super.updateProgress(value);
    } finally {
      _$CampaignStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleReadMore() {
    final _$actionInfo = _$CampaignStoreBaseActionController.startAction(
        name: 'CampaignStoreBase.toggleReadMore');
    try {
      return super.toggleReadMore();
    } finally {
      _$CampaignStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
progress: ${progress},
raisedSoFar: ${raisedSoFar},
daysLeft: ${daysLeft},
isExpanded: ${isExpanded},
selectedIndex: ${selectedIndex}
    ''';
  }
}
