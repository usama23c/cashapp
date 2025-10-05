import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Controller/Account_card.dart';
import '../Controller/listview_controller.dart';
import 'Custom_Textfield_wodget.dart';
import 'account_list_doller.dart';

class SendFound extends StatelessWidget {
  SendFound({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobilenumbercontroller = TextEditingController();
  final BalanceController controller = Get.put(BalanceController());
  final CircularImageController controllercircle =
      Get.put(CircularImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffebf5f6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16), // ✅ Added Padding
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // ✅ Left align everything
                children: [
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: Icon(Icons.arrow_back_ios,
                                color: Colors.grey, size: 22.sp)
                            .bounceInLeft(),
                      ),
                      Text("Send Founds",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600))
                          .animate()
                          .fade(duration: 500.ms)
                          .scale(delay: 500.ms),
                      SizedBox(width: 4.h),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Center(
                    child: Text("FROM",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600))
                        .animate()
                        .fade(duration: 500.ms)
                        .scale(delay: 500.ms),
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    height: 18.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.accounts.length,
                      itemBuilder: (context, index) {
                        return AccountCard(
                          balance: controller.accounts[index]["balance"],
                          decimal: controller.accounts[index]["decimal"],
                          type: controller.accounts[index]["type"],
                          index: index,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 1.h),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: 2.h),
                  Center(
                    child: Text("TO",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: 1.h),
                  CustomTextField(
                    controller: fullNameController,
                    hintText: "Full Name",
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 1.h),
                  CustomTextField(
                    controller: mobilenumbercontroller,
                    hintText: "Mobile number",
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 2,
                          color: const Color(0xffcfdede),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "RECENT",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 2,
                          color: const Color(0xffcfdede),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    height: 14.h,
                    child: Obx(
                      () => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controllercircle.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(
                                      controllercircle.imageUrls[index]),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  controllercircle.girlNames[index],
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Center(
                    child: Container(
                      height: 7.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                          color: const Color(0xff21d0cb),
                          borderRadius: BorderRadius.circular(14)),
                      child: Center(
                        child: Text("Send",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
