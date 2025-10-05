import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerController extends GetxController {
  RxString scannedCode = ''.obs;
  MobileScannerController mobileScannerController = MobileScannerController();

  void onDetect(BarcodeCapture barcode) {
    final String? code = barcode.barcodes.first.rawValue;
    if (code != null && code.isNotEmpty) {
      scannedCode.value = code;
      mobileScannerController.stop(); // Stops after one scan
    }
  }

  void restartScanner() {
    mobileScannerController.start();
    scannedCode.value = '';
  }

  @override
  void onClose() {
    mobileScannerController.dispose();
    super.onClose();
  }
}
