import 'package:get/get.dart';

class BalanceController extends GetxController {
  var balance = 29.0000.obs;
  var percentageChange = 8.4.obs;
  var amountChange = 2134.42.obs;
  var previousBalance = 100.00.obs;
  void updateBalance(double newBalance) {
    previousBalance.value = balance.value;
    balance.value = newBalance;
  }

  bool isBalanceUp() {
    return balance.value > previousBalance.value;
  }
}
