import 'package:ecommerce_app/app/modules/auth/FirebaseServices/auth_service.dart';
import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants.dart';
import '../../controllers/settings_controller.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final bool isAccount;
  final bool isDark;
  const SettingsItem({
    Key? key,
    required this.title,
    this.isAccount = false,
    this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return ListTile(
      title:
          Text(title == "" ? FirebaseAuth.instance.currentUser!.email! : title,
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: 16.sp,
              )),
      trailing: isDark
          ? GetBuilder<SettingsController>(
              id: 'Theme',
              builder: (controller) => CupertinoSwitch(
                value: !controller.isLightTheme,
                onChanged: controller.changeTheme,
                activeColor: theme.primaryColor,
              ),
            )
          : InkWell(
              onTap: () async {
                await AuthService().signout(context: context);
                Get.offNamed(Routes.LOGIN);
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: SvgPicture.asset(Constants.forwardArrowIcon,
                    fit: BoxFit.none),
              ),
            ),
    );
  }
}
