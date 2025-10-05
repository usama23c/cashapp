import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Controller/Menu_controller.dart';

class MenuScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.credit_card, "title": "Cards"},
    {"icon": Icons.sync, "title": "Top-up"},
    {"icon": Icons.currency_exchange, "title": "Exchange"},
    {"icon": Icons.monetization_on, "title": "Loans"},
    {"icon": Icons.attach_money, "title": "Budget"},
    {"icon": Icons.atm, "title": "ATM"},
    {"icon": Icons.receipt_long, "title": "Pay bills"},
    {"icon": Icons.airplane_ticket, "title": "Tickets"},
    {"icon": Icons.grid_view, "title": "See all"},
    {"icon": Icons.verified_user, "title": "Legal"},
    {"icon": Icons.settings, "title": "Settings"},
    {"icon": Icons.info, "title": "About"},
  ];

  final MenuControllerX controller = Get.put(MenuControllerX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe3f4f1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              Center(
                child: Row(
                  children: [
                    SizedBox(width: 2.w),
                    InkWell(
                      onTap: () => Get.back(),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child:
                            Icon(Icons.close, size: 22.sp, color: Colors.grey),
                      ),
                    ).bounceInUp(),
                    SizedBox(width: 23.w),
                    Text(
                      "Menu",
                      style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                        .animate()
                        .fade(duration: 500.ms)
                        .scale(delay: 500.ms)
                        .then()
                        .shake(hz: 2, duration: const Duration(seconds: 1)),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              Center(child: sectionTitle("BANKING")),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: menuGrid(menuItems.sublist(0, 6)),
              ),
              divider(),
              Center(child: sectionTitle("SERVICES")),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: menuGrid(menuItems.sublist(6, 9)),
              ),
              divider(),
              Center(child: sectionTitle("ACCOUNT")),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: menuGrid(menuItems.sublist(9, 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget menuGrid(List<Map<String, dynamic>> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.w,
        mainAxisSpacing: 2.h,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        var item = items[index];
        return menuItem(item["icon"], item["title"]);
      },
    );
  }

  Widget menuItem(IconData icon, String title) {
    return Obx(() {
      bool isSelected = controller.selectedMenuItem.value == title;
      return GestureDetector(
        onTap: () {
          controller.selectMenuItem(title);
        },
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 300),
          tween: Tween<double>(begin: 0.0, end: isSelected ? 9.h : 9.h),
          curve: Curves.easeOutBack,
          builder: (context, double height, child) {
            return Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  transform: Matrix4.translationValues(
                    0,
                    isSelected ? -10 : 0,
                    0,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xff21d0cb) : Colors.white,
                    borderRadius: BorderRadius.circular(6.w),
                    boxShadow: [
                      if (isSelected)
                        BoxShadow(
                          color: const Color(0xff21d0cb).withOpacity(0.7),
                          blurRadius: 15,
                          spreadRadius: 5,
                        ),
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.2),
                        blurRadius: 6,
                        spreadRadius: 2,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: isSelected ? 28.sp : 24.sp,
                      color:
                          isSelected ? Colors.white : const Color(0xff21d0cb),
                    ),
                  ),
                  height: height,
                  width: 9.h,
                ),
                SizedBox(height: 1.2.h),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: isSelected ? 1.0 : 0.7,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: isSelected ? 16.sp : 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        ),
      );
    });
  }

  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Divider(
        endIndent: 10,
        indent: 10,
        color: Colors.grey.shade400,
        thickness: 1.2,
      ),
    );
  }
}
