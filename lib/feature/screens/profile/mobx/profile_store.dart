import 'package:little_light_v01/core/constants/image_constants.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = ProfileStoreBase with _$ProfileStore;

abstract class ProfileStoreBase with Store {
  @observable
  String name = 'Travis Marlin';

  @observable
  String email = 'TravisM97@icloud.com';

  @observable
  String profileImage = LLCImageConstant.profile;

  @observable
  String bio = 'A passionate supporter of charity.';

  @observable
  bool isPostsSelected = true;

  @action
  void updateProfile(String newName, String newEmail, String newImage, String newBio) {
    name = newName;
    email = newEmail;
    profileImage = newImage;
    bio = newBio;
  }

  @action
  void selectPosts() {
    isPostsSelected = true;
  }

  @action
  void selectReels() {
    isPostsSelected = false;
  }
}
