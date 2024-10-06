import 'package:mobx/mobx.dart';

part 'category_store.g.dart';

class CategoryStore = CategoryStoreBase with _$CategoryStore;

abstract class CategoryStoreBase with Store {
  @observable
  int selectedIndex = -1;

  @action
  void selectCategory(int index) {
    selectedIndex = index;
  }
}
