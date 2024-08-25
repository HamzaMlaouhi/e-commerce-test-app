import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Constants.logo,
                width: 200.w,
                height: 120.h,
              ).animate().fade().slideY(
                  duration: const Duration(milliseconds: 500),
                  begin: 1,
                  curve: Curves.easeInSine),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
