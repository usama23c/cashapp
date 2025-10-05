import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class GraphController extends GetxController {
  var spots = <FlSpot>[].obs;
  var percentageChange = 0.0.obs;
  var amountChange = 0.0.obs;
  var balance = 1000.0.obs;

  Random random = Random();
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _generateInitialData();
    _startUpdatingGraph();
  }

  void _generateInitialData() {
    spots.value = List.generate(
      8,
      (index) => FlSpot(index.toDouble(), random.nextDouble() * 2),
    );
    _calculateChange();
  }

  void _startUpdatingGraph() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      double lastX = spots.last.x;
      double lastY = spots.last.y;
      double newY = lastY + (random.nextBool() ? 0.2 : -0.2);
      newY = newY.clamp(0.5, 2.5);

      spots.add(FlSpot(lastX + 1, newY));
      if (spots.length > 4) spots.removeAt(0);

      _calculateChange();
      spots.refresh();
    });
  }

  void _calculateChange() {
    if (spots.length < 2) return;

    double oldValue = spots[spots.length - 2].y;
    double newValue = spots.last.y;

    amountChange.value = (newValue - oldValue).abs();
    percentageChange.value =
        ((amountChange.value / oldValue) * 10).clamp(0.5, 10.0);
    balance.value +=
        (random.nextBool() ? amountChange.value : -amountChange.value);
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
