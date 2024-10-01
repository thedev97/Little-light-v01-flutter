import 'package:mobx/mobx.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  @observable
  int selectedIndex = -1;

  @action
  void selectCategory(int index) {
    selectedIndex = index;
  }
}
