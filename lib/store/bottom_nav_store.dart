import 'package:mobx/mobx.dart';

part 'bottom_nav_store.g.dart';

class BottomNavStore = BottomNavStoreBase with _$BottomNavStore;

abstract class BottomNavStoreBase with Store {
  @observable
  int currentIndex = 0;

  @action
  void setIndex(int index) {
    currentIndex = index;
  }
}
