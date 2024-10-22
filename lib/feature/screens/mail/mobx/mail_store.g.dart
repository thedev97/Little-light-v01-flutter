// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MailStore on MailStoreBase, Store {
  late final _$mailsAtom = Atom(name: 'MailStoreBase.mails', context: context);

  @override
  ObservableList<Map<String, String>> get mails {
    _$mailsAtom.reportRead();
    return super.mails;
  }

  @override
  set mails(ObservableList<Map<String, String>> value) {
    _$mailsAtom.reportWrite(value, super.mails, () {
      super.mails = value;
    });
  }

  late final _$MailStoreBaseActionController =
      ActionController(name: 'MailStoreBase', context: context);

  @override
  void addMail(Map<String, String> mail) {
    final _$actionInfo = _$MailStoreBaseActionController.startAction(
        name: 'MailStoreBase.addMail');
    try {
      return super.addMail(mail);
    } finally {
      _$MailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mails: ${mails}
    ''';
  }
}
