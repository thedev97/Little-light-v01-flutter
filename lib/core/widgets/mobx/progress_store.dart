import 'package:mobx/mobx.dart';

part 'progress_store.g.dart';

class ProgressStore = ProgressStoreBase with _$ProgressStore;

abstract class ProgressStoreBase with Store {
  @observable
  double progressValue = 0.0;

  @action
  void updateProgress(double value) {
    progressValue = value;
  }
}
