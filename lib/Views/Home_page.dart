import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Controller/Account_card.dart';
import '../Controller/Graph_controlle.dart';
import 'Menu_page.dart';
import 'Send_Found.dart';
import 'account_list_doller.dart';

class HomePage extends StatelessWidget {
  final BalanceController controller = Get.put(BalanceController());
  final List<Map<String, dynamic>> accounts = [
    {"balance": "12.244", "decimal": "81", "type": "BANK"},
    {"balance": "8.460", "decimal": "24", "type": "SAVINGS"},
    {"balance": "3.200", "decimal": "10", "type": "CREDIT"},
    {"balance": "12.244", "decimal": "81", "type": "BANK"},
    {"balance": "8.460", "decimal": "24", "type": "SAVINGS"},
    {"balance": "3.200", "decimal": "10", "type": "CREDIT"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffd9ece7),
              Color(0xffe5edee),
              Color(0xffe9f3f4),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/pi (1).jpg'),
                    radius: 6.sw,
                  ).animate().fade(duration: 800.ms).scale(),
                  SizedBox(width: 4.w),
                  Text('Hi! Husnain',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600))
                      .animate()
                      .fadeIn(duration: 700.ms)
                      .slideY(begin: 0.5, end: 0, curve: Curves.easeOut),
                  Spacer(),
                  Icon(Icons.notifications_none,
                          size: 7.sw, color: Color(0xff8b8a89))
                      .animate()
                      .shake(duration: 800.ms, hz: 2),
                  SizedBox(width: 3.w),
                  InkWell(
                    onTap: () {
                      Get.to(
                        MenuScreen(),
                        transition: Transition.downToUp,
                        duration: Duration(milliseconds: 500),
                      );
                    },
                    child: Icon(Icons.menu_outlined,
                            size: 7.sw, color: Color(0xff8b8a89))
                        .animate()
                        .slideX(begin: 1, end: 0, duration: 500.ms),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.h),
            Container(
              width: double.infinity.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffe7f1f1), Color(0xffe5edee)],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  topLeft: Radius.circular(35),
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                child: _buildBalanceCard()
                    .animate()
                    .fade(duration: 500.ms)
                    .scaleXY(begin: 0.8, end: 1.0),
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                SizedBox(width: 5.w),
                Text(
                  "Accounts",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ).animate().fade(duration: 400.ms).slideX(begin: -0.5, end: 0),
              ],
            ),
            SizedBox(height: 1.0.h),
            Expanded(
              child: SizedBox(
                height: 30.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: accounts.length,
                  itemBuilder: (context, index) {
                    return AccountCard(
                      balance: accounts[index]["balance"],
                      decimal: accounts[index]["decimal"],
                      type: accounts[index]["type"],
                      index: index,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 1.0.h),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Obx(() => Container(
          height: 44.h,
          padding: EdgeInsets.only(top: 15, bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 6.w),
                  Text(
                    "Balance",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 55.w,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(SendFound());
                    },
                    child: Container(
                      height: 5.h,
                      width: 5.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff21d0cb),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 5.w),
                  Text(
                    "\$${controller.balance.value.toStringAsFixed(2)}0",
                    style:
                        TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      ",45",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() {
                if (graphController.percentageChange.value == 0 ||
                    graphController.amountChange.value == 1) {
                  return SizedBox();
                }
                final isPositive = graphController.percentageChange.value >= 2;
                return Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 5.w),
                      Icon(
                        isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                        color: isPositive ? Color(0xff4ecdc4) : Colors.red,
                        size: 5.w,
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        "+${graphController.percentageChange.value.toStringAsFixed(2)}%",
                        style: TextStyle(
                          color: isPositive ? Color(0xff4ecdc4) : Colors.red,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        "(\$${graphController.amountChange.value.toStringAsFixed(2)})",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: 2.h),
              _buildGraph()
                  .animate()
                  .fade(duration: 800.ms)
                  .slideY(begin: 1.0, end: 0, curve: Curves.easeOutBack)
                  .scaleXY(begin: 0.9, end: 1.0, curve: Curves.easeOut),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton('images/send_icon_remove.png', 'SEND     ')
                      .animate()
                      .fade(duration: 500.ms)
                      .scaleXY(begin: 0.8, end: 1.0)
                      .shake(hz: 2, duration: Duration(seconds: 1)),
                  _buildActionButton('images/requst_icon_remove.png', 'REQUEST')
                      .animate()
                      .fade(duration: 500.ms)
                      .scaleXY(begin: 0.8, end: 1.0)
                      .shake(hz: 2, duration: Duration(seconds: 1)),
                ],
              ),
            ],
          ),
        )
            .animate()
            .fade(duration: 1000.ms)
            .slideY(begin: 1.0, end: 0, curve: Curves.easeOutBack)
            .scaleXY(begin: 0.95, end: 1.0, curve: Curves.easeOut));
  }

  final GraphController graphController = Get.put(GraphController());
  Widget _buildGraph() {
    return SizedBox(
      height: 15.h,
      child: Obx(() => LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: graphController.spots,
                  isCurved: true,
                  gradient: LinearGradient(
                    colors: [Color(0xff21d0cb), Color(0xff21d0cb)],
                  ),
                  barWidth: 1.w,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff3bedcc).withOpacity(0.6),
                        Colors.white.withOpacity(0.2),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          )
              .animate()
              .fade(duration: 800.ms) // Fade-in
              .slideY(begin: 1.0, end: 0, curve: Curves.easeOutBack)
              .scaleXY(begin: 0.9, end: 1.0, curve: Curves.easeOut)),
    );
  }

  Widget _buildActionButton(String imagePath, String text) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 37.w,
        height: 6.h,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(12),
          color: Color(0xffebf5f5),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 8.w,
              height: 8.h,
              color: Color(0xff21d0cb),
            ).animate().fade(duration: 600.ms).scaleXY(begin: 0.8, end: 1.0),
            SizedBox(width: 2.w),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ).animate().fade(duration: 600.ms).slideY(begin: 0.5, end: 0),
          ],
        ),
      )
          .animate()
          .fade(duration: 800.ms)
          .slideY(begin: 1.0, end: 0, curve: Curves.easeOutBack)
          .scaleXY(begin: 0.9, end: 1.0, curve: Curves.easeOut)
          .shake(hz: 2, duration: Duration(seconds: 1)),
    );
  }
}
