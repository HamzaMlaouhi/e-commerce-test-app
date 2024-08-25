import 'package:ecommerce_app/app/modules/auth/login/controllers/login_controller.dart';
import 'package:get/get.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
