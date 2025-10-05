import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:device_preview/device_preview.dart'; // ✅ DevicePreview import

import 'Views/Bottombar_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en_US', null);

  runApp(
    DevicePreview(
      enabled: true, // false rakho jab release karna ho
      builder: (context) => MyApp(),
    ),
  );
}
//muhammad Husnain shahid
//https://github.com/muhammadhusnainshahid

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 900) {
        // 🖥️ Desktop or Large Screen Layout
        return buildWideScreenLayout();
      } else {
        // 📱 Mobile or Tablet Layout
        return buildMobileLayout();
      }
    });
  }

  /// 🖥️ Desktop / Large Screen Layout
  Widget buildWideScreenLayout() {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true, // ✅ for DevicePreview
          builder: DevicePreview.appBuilder, // ✅ DevicePreview integration
          locale: DevicePreview.locale(context),
          title: 'Cash Wrap',
          home: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 900),
              child: CustomBottomNavBar(),
            ),
          ),
        );
      },
    );
  }

  /// 📱 Mobile Layout
  Widget buildMobileLayout() {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true, // ✅ for DevicePreview
          builder: DevicePreview.appBuilder, // ✅ DevicePreview integration
          locale: DevicePreview.locale(context),
          title: 'Cash Wrap',
          home: CustomBottomNavBar(),
        );
      },
    );
  }
}
