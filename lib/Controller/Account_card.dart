import 'package:get/get.dart';

class BalanceController extends GetxController {
  var selectedIndex = (-1).obs;
  var balance = 29.0000.obs;
  var percentageChange = 4.4.obs;
  var amountChange = 2134.42.obs;
  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Map<String, dynamic>> accounts = [
    {"balance": "12.244", "decimal": "81", "type": "BANK"},
    {"balance": "8.460", "decimal": "24", "type": "SAVINGS"},
    {"balance": "3.200", "decimal": "10", "type": "CREDIT"},
    {"balance": "12.244", "decimal": "81", "type": "BANK"},
    {"balance": "8.460", "decimal": "24", "type": "SAVINGS"},
    {"balance": "3.200", "decimal": "10", "type": "CREDIT"},
  ];
}
