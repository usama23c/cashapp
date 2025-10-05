// // import 'package:animate_do/animate_do.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_animate/flutter_animate.dart';
// // import 'package:get/get.dart';
// // import 'package:responsive_sizer/responsive_sizer.dart';
// //
// // import '../Controller/BalanceController.dart';
// //
// // class AccountListDoller extends StatelessWidget {
// //   AccountListDoller({super.key});
// //   final BalanceController controller = Get.put(BalanceController());
// //   final List<Map<String, dynamic>> accounts = [
// //     {"balance": "12.244", "decimal": "81", "type": "BANK"},
// //     {"balance": "8.460", "decimal": "24", "type": "SAVINGS"},
// //     {"balance": "3.200", "decimal": "10", "type": "CREDIT"},
// //     {"balance": "12.244", "decimal": "81", "type": "BANK"},
// //     {"balance": "8.460", "decimal": "24", "type": "SAVINGS"},
// //     {"balance": "3.200", "decimal": "10", "type": "CREDIT"},
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body:,
// //     );
// //   }
// // }
// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// class AccountCard extends StatelessWidget {
//   final String balance;
//   final String decimal;
//   final String type;
//
//   const AccountCard({
//     Key? key,
//     required this.balance,
//     required this.decimal,
//     required this.type,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 14),
//       child: ZoomIn(
//         duration: Duration(milliseconds: 600),
//         child: Container(
//           width: 36.w,
//           height: 20.h,
//           padding: EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.transparent,
//                 blurRadius: 8,
//                 spreadRadius: 2,
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   SizedBox(
//                     width: 13.w,
//                     height: 6.h,
//                     child: TweenAnimationBuilder<Color?>(
//                       tween: ColorTween(
//                           begin: Colors.grey.shade400, end: Color(0xff21d0cb)),
//                       duration: Duration(seconds: 2),
//                       builder: (context, color, child) {
//                         return Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             SizedBox(
//                               width: 13.w,
//                               height: 6.h,
//                               child: TweenAnimationBuilder<double>(
//                                 tween: Tween<double>(begin: 0.0, end: 0.8),
//                                 duration: Duration(seconds: 2),
//                                 builder: (context, value, child) {
//                                   return CircularProgressIndicator(
//                                     value: value,
//                                     strokeWidth: 3.4,
//                                     backgroundColor: Colors.grey.shade200,
//                                     valueColor: AlwaysStoppedAnimation(color),
//                                   );
//                                 },
//                               ),
//                             ),
//                             Icon(Icons.attach_money, color: color, size: 22.sp),
//                           ],
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 1.5.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "\$$balance",
//                     style:
//                         TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w700),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 4),
//                     child: Text(
//                       ",$decimal",
//                       style: TextStyle(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.grey),
//                     ),
//                   ),
//                 ],
//               ),
//               Text(
//                 type,
//                 style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 12.sp,
//                     fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//         ),
//       ),
//     )
//         .animate()
//         .fade(duration: 300.ms)
//         .slideX(begin: -1, end: 0, curve: Curves.easeOut);
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Controller/Account_card.dart';

class AccountCard extends StatelessWidget {
  final String balance;
  final String decimal;
  final String type;
  final int index;

  AccountCard({
    required this.balance,
    required this.decimal,
    required this.type,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final BalanceController controller = Get.find();

    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;

      return Column(
        children: [
          GestureDetector(
            onTap: () {
              controller.updateSelectedIndex(index);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 36.w,
                height: 16.h,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Color(0xff21d2cc)
                      : Colors.white, // Selected color
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 13.w,
                          child: TweenAnimationBuilder<Color?>(
                            tween: ColorTween(
                                begin: Colors.grey,
                                end: isSelected
                                    ? Colors.white
                                    : Color(0xff21d0cb)),
                            duration: Duration(seconds: 2),
                            builder: (context, color, child) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 13.w,
                                    height: 6.h,
                                    child: TweenAnimationBuilder<double>(
                                      tween:
                                          Tween<double>(begin: 0.0, end: 0.8),
                                      duration: Duration(seconds: 2),
                                      builder: (context, value, child) {
                                        return CircularProgressIndicator(
                                          value: value,
                                          strokeWidth: 3.4,
                                          backgroundColor: Colors.grey.shade400,
                                          valueColor:
                                              AlwaysStoppedAnimation(color),
                                        );
                                      },
                                    ),
                                  ),
                                  Icon(Icons.attach_money,
                                      color: color, size: 22.sp),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.4.h),
                    Text(
                      "\$$balance,$decimal",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      type,
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
