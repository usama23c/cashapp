import 'package:get/get.dart';

class MenuControllerX extends GetxController {
  var selectedMenuItem = "".obs;

  void selectMenuItem(String title) {
    selectedMenuItem.value = title;
  }
}
