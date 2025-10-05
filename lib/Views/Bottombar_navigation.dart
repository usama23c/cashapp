import 'package:cash_wrap/Views/Scanner_screen.dart';
import 'package:cash_wrap/Views/Send_Found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Controller/BottomNav_Controller.dart';
import 'Home_page.dart';
import 'Transection_page.dart';

class CustomBottomNavBar extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _getBody(controller.selectedIndex.value)),
      backgroundColor: Color(0xffe7f1f1),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(38),
          topRight: Radius.circular(38),
        ),
        child: Container(
          height: 16.h,
          color: Color(0xff3fc1c0),
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.credit_card_outlined, 0),
              _buildNavItem(Icons.search, 1),
              _buildCenterButton(),
              _buildNavItem(Icons.person_pin_outlined, 3),
              _buildNavItem(Icons.person_add_alt_outlined, 4),
            ],
          ),
        )
            .animate()
            .fade(duration: 600.ms)
            .slideY(
                begin: 1, end: 0, duration: 1000.ms, curve: Curves.easeOutBack)
            .shake(hz: 1.5, curve: Curves.easeInOut),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return Obx(() => GestureDetector(
          onTap: () => controller.changeIndex(index),
          child: AnimatedContainer(
            duration: 300.ms,
            transform: controller.selectedIndex.value == index
                ? Matrix4.translationValues(0, -5, 0)
                : Matrix4.translationValues(0, 0, 0),
            child: Icon(
              icon,
              size: 30,
              color: controller.selectedIndex.value == index
                  ? Colors.white
                  : Colors.white54,
            )
                .animate()
                .scaleXY(
                    begin: controller.selectedIndex.value == index ? 0.8 : 1,
                    end: controller.selectedIndex.value == index ? 1.1 : 1,
                    duration: 400.ms,
                    curve: Curves.easeOut)
                .then()
                .shake(hz: 3, curve: Curves.easeInOut)
                .fade(duration: 400.ms),
          ),
        ));
  }

  Widget _buildCenterButton() {
    return GestureDetector(
      onTap: () {
        controller.changeIndex(2);
      },
      child: Container(
        width: 15.w,
        height: 15.h,
        decoration: BoxDecoration(
          color: Color(0xff34f3ee),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
        ),
      )
          .animate()
          .scaleXY(begin: 0.8, end: 1.2, duration: 300.ms)
          .then()
          .scaleXY(end: 1, duration: 300.ms, curve: Curves.elasticOut)
          .then()
          .moveY(begin: -10, end: 0, duration: 500.ms, curve: Curves.bounceOut),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return TransactionsScreen();
      case 2:
        return ScannerScreen();
      case 3:
        return Center(child: Text("Favorites Screen"));
      case 4:
        return SendFound();
      default:
        return Center(child: Text("Home Screen"));
    }
  }
}
