import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

class localString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_kh': {
          'Setting': 'ការកំណត់',
          'Community': 'សហគមន៍',
          'About me': 'អំពី​ខ្ញុំ',
          'English': 'ភាសាខ្មែរ'
        },
        'en_us': {
          'ការកំណត់': 'Setting',
          'សហគមន៍': 'Community',
          'អំពី​ខ្ញុំ': 'About me',
          'ភាសាខ្មែរ': 'English'
        }
      };
}

final con = GetStorage();

class Get_controller extends GetxController {
  String i = ''.obs();
  Get(String n) {
    i = n;
    con.write('show', i);
    update();
  }

  show() {
    String s;
    s = con.read('show');
  }
}
