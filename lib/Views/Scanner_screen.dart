import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../Controller/Scnner_controller.dart';

class ScannerScreen extends StatelessWidget {
  final ScannerController controller = Get.put(ScannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Real-Time Scanner')),
      body: Stack(
        children: [
          // Real-time Camera Scanner
          MobileScanner(
            controller: controller.mobileScannerController,
            onDetect: controller.onDetect,
          ),

          // Scan Result Overlay
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(() => controller.scannedCode.isNotEmpty
                ? Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: Text(
                      'Scanned: ${controller.scannedCode.value}',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  )
                : const SizedBox()),
          ),

          // Restart Button
          Positioned(
            bottom: 100,
            left: MediaQuery.of(context).size.width * 0.3,
            child: ElevatedButton(
              onPressed: () => controller.restartScanner(),
              child: const Text('Scan Again'),
            ),
          ),
        ],
      ),
    );
  }
}
