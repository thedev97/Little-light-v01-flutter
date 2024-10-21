import 'package:mobx/mobx.dart';

part 'campaign_store.g.dart';

class CampaignStore = CampaignStoreBase with _$CampaignStore;

abstract class CampaignStoreBase with Store {
  @observable
  double progress = 0.0;

  @observable
  double raisedSoFar = 0.0;

  @observable
  String daysLeft = '15';

  @observable
  bool isExpanded = false;

  @observable
  int selectedIndex = 0;

  @action
  void selectCategory(int index) {
    selectedIndex = index;
  }

  @action
  void updateProgress(double value) {
    progress = value;
  }

  @action
  void toggleReadMore() {
    isExpanded = !isExpanded;
  }
}
