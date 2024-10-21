import 'package:little_light_v01/core/constants/image_constants.dart';
import 'package:mobx/mobx.dart';

part 'bookmark_store.g.dart';

class BookmarkStore = BookmarkStoreBase with _$BookmarkStore;

abstract class BookmarkStoreBase with Store {
  @observable
  ObservableList<Map<String, String>> bookmarks = ObservableList.of([
    {
      'title': 'Support Education for Gaza',
      'description': 'Help us raise funds for Gaza!',
      'image': LLCImageConstant.charity1
    },
    {
      'title': 'Support Health Initiatives',
      'description': 'Donate for health campaigns',
      'image': LLCImageConstant.charity2
    },
    {
      'title': 'Help Build Homes',
      'description': 'Help us build homes for families in need',
      'image': LLCImageConstant.charity3
    },
    {
      'title': 'Support Education for Gaza',
      'description': 'Help us raise funds for Gaza!',
      'image': LLCImageConstant.charity4
    },
    {
      'title': 'Support Health Initiatives',
      'description': 'Donate for health campaigns',
      'image': LLCImageConstant.charity5
    },
    {
      'title': 'Support Health Initiatives',
      'description': 'Donate for health campaigns',
      'image': LLCImageConstant.charity6
    }
  ]);

  @action
  void removeBookmark(int index) {
    bookmarks.removeAt(index);
  }

  @action
  void addBookmark(Map<String, String> bookmark) {
    bookmarks.add(bookmark);
  }
}
