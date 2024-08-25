import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../components/screen_title.dart';
import '../controllers/settings_controller.dart';
import 'widgets/settings_item.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            30.verticalSpace,
            const ScreenTitle(
              title: 'Settings',
              dividerEndIndent: 230,
            ),
            20.verticalSpace,
            Text('Account',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                )),
            20.verticalSpace,
            const SettingsItem(
              title: "",
              isAccount: true,
            ),
            30.verticalSpace,
            Text('Settings',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                )),
            20.verticalSpace,
            const SettingsItem(
              title: 'Dark Mode',
              isDark: true,
            ),
            25.verticalSpace,
            const SettingsItem(
              title: 'Sign Out',
              // icon: Constants.logoutIcon,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
