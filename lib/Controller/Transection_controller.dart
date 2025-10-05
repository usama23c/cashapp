import 'package:get/get.dart';

class TransactionController extends GetxController {
  var transactions = <Map<String, dynamic>>[
    {
      "title": "Electricity",
      "date": "21 Feb, 2018",
      "amount": "-\$121.36",
      "isCredit": false,
      "icon": "images/icon_f.png",
    },
    {
      "title": "McDonalds",
      "date": "19 Feb, 2018",
      "amount": "-\$245.29",
      "isCredit": true,
      "icon": "images/icon_s.png",
    },
    {
      "title": "Funds received",
      "date": "17 Feb, 2018",
      "amount": "+\$700.00",
      "isCredit": false,
      "icon": "images/icon_t.png",
    },
    {
      "title": "Royalz revenue",
      "date": "16 Feb, 2018",
      "amount": "+\$1,245.45",
      "isCredit": true,
      "icon": "images/icon_fi.png",
    },
    {
      "title": "Spotify Subscr.",
      "date": "11 Feb, 2018",
      "amount": "-\$21.36",
      "isCredit": false,
      "icon": "images/icon_f.png",
    },
    {
      "title": "Spotify Subscr.",
      "date": "11 Feb, 2018",
      "amount": "-\$21.36",
      "isCredit": true,
      "icon": "images/icon_s.png",
    },
    {
      "title": "Electricity",
      "date": "21 Feb, 2018",
      "amount": "-\$121.36",
      "isCredit": false,
      "icon": "images/icon_f.png",
    },
    {
      "title": "McDonalds",
      "date": "19 Feb, 2018",
      "amount": "-\$245.29",
      "isCredit": true,
      "icon": "images/icon_s.png",
    },
    {
      "title": "Funds received",
      "date": "17 Feb, 2018",
      "amount": "+\$700.00",
      "isCredit": false,
      "icon": "images/icon_t.png",
    },
    {
      "title": "Royalz revenue",
      "date": "16 Feb, 2018",
      "amount": "+\$1,245.45",
      "isCredit": true,
      "icon": "images/icon_fi.png",
    },
    {
      "title": "Spotify Subscr.",
      "date": "11 Feb, 2018",
      "amount": "-\$21.36",
      "isCredit": false,
      "icon": "images/icon_f.png",
    },
    {
      "title": "Spotify Subscr.",
      "date": "11 Feb, 2018",
      "amount": "-\$21.36",
      "isCredit": true,
      "icon": "images/icon_s.png",
    },
  ].obs;
  var searchBarFocused = false.obs;
  var searchQuery = "".obs;
  List<Map<String, dynamic>> get filteredTransactions {
    if (searchQuery.isEmpty) {
      return transactions;
    } else {
      return transactions
          .where((item) => item["title"]
              .toString()
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  void updateSearch(String query) {
    searchQuery.value = query;
  }
}
