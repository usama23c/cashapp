import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Controller/Transection_controller.dart';

class TransactionsScreen extends StatelessWidget {
  final TransactionController controller = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xffd4e2e2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back_ios,
                          color: Colors.grey, size: 22.sp)
                      .bounceInLeft(),
                ),
                Text(
                  "Transactions",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ).animate().fade(duration: 500.ms).scale(delay: 500.ms),
                SizedBox(width: 5.h),
              ],
            ),
            SizedBox(height: 2.h),
            Container(
              height: 75.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffebf5f6),
                    Color(0xffd9ece7),
                    Color(0xffe5edee),
                    Color(0xffe9f3f4),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: TweenAnimationBuilder(
                      duration: 800.ms,
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, (1 - value) * 20),
                          child: Opacity(opacity: value, child: child),
                        );
                      },
                      child: FocusScope(
                        onFocusChange: (hasFocus) {
                          controller.searchBarFocused.value = hasFocus;
                        },
                        child: Obx(
                          () => Container(
                            height: 6.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: controller.searchBarFocused.value
                                      ? Colors.tealAccent.withOpacity(0.2)
                                      : Colors.black12,
                                  blurRadius: controller.searchBarFocused.value
                                      ? 12
                                      : 8,
                                  spreadRadius:
                                      controller.searchBarFocused.value ? 3 : 2,
                                ),
                              ],
                            ),
                            child: TextField(
                              onChanged: controller.updateSearch,
                              decoration: InputDecoration(
                                hintText: "Search for...",
                                hintStyle: TextStyle(fontSize: 16.sp),
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.grey)
                                        .animate()
                                        .scaleXY(
                                            begin: 1,
                                            end: 1.1,
                                            duration: 400.ms)
                                        .then()
                                        .scaleXY(
                                            end: 1,
                                            duration: 400.ms,
                                            curve: Curves.easeOut),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 1.2.h, horizontal: 4.w),
                              ),
                              style: TextStyle(fontSize: 16.sp),
                            ).animate().shake(hz: 1.5, curve: Curves.easeInOut),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        itemCount: controller.filteredTransactions.length,
                        separatorBuilder: (_, __) =>
                            Divider(color: Color(0xffd9ece7)),
                        itemBuilder: (context, index) {
                          var item = controller.filteredTransactions[index];
                          return ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 1.h),
                            leading: CircleAvatar(
                              radius: 7.w,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                item["icon"].toString(),
                                height: 5.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Text(
                              item["title"].toString(),
                              style: TextStyle(
                                  fontSize: 17.sp, fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              item["date"].toString(),
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                            ),
                            trailing: Text(
                              item["amount"].toString(),
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: (item["isCredit"] as bool)
                                    ? Color(0xff21d0cb)
                                    : Colors.red,
                              ),
                            ),
                          )
                              .animate()
                              .fade(duration: 300.ms, delay: (index * 150).ms)
                              .slideX(begin: -1, end: 0, curve: Curves.easeOut);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
