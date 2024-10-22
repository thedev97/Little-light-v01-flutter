import 'package:little_light_v01/core/constants/image_constants.dart';
import 'package:mobx/mobx.dart';

part 'mail_store.g.dart';

class MailStore = MailStoreBase with _$MailStore;

abstract class MailStoreBase with Store {
  @observable
  ObservableList<Map<String, String>> mails = ObservableList.of([
    {
      'sender': 'John Doe',
      'subject': 'Support Education for Gaza',
      'image': LLCImageConstant.profile1,
      'snippet': 'Raise funds.',
      'timestamp': '9:45 AM',
    },
    {
      'sender': 'Michel Fluff',
      'subject': 'Support Health Initiatives',
      'image': LLCImageConstant.profile2,
      'snippet': 'Donate for health campaigns.',
      'timestamp': '8:30 AM',
    },
    {
      'sender': 'Natallia Rugg',
      'subject': 'Help Build Homes',
      'image': LLCImageConstant.profile3,
      'snippet': 'Help us build homes for families in need.',
      'timestamp': '7:20 AM',
    },
    {
      'sender': 'Shereen Light',
      'subject': 'Support Education for Gaza',
      'image': LLCImageConstant.profile4,
      'snippet': 'Help us raise funds for Gaza!.',
      'timestamp': '7:20 AM',
    },
    {
      'sender': 'Shereen Light',
      'subject': 'Support Education for Gaza',
      'image': LLCImageConstant.profile5,
      'snippet': 'Help us raise funds for Gaza!.',
      'timestamp': '7:20 AM',
    },
    {
      'sender': 'Yasmin Light',
      'subject': 'Support Education for Gaza',
      'image': LLCImageConstant.profile6,
      'snippet': 'Help us raise funds for Gaza!.',
      'timestamp': '7:20 AM',
    },
  ]);

  @action
  void addMail(Map<String, String> mail) {
    mails.add(mail);
  }
}
