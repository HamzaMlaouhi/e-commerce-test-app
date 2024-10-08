import 'package:ecommerce_app/app/routes/app_pages.dart';
import 'package:get/get.dart';


class SplashController extends GetxController {

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(Routes.LOGIN);
    super.onInit();
  }

}
