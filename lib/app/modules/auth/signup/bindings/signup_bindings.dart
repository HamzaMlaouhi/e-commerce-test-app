import 'package:ecommerce_app/app/modules/auth/signup/controllers/signup_controller.dart';
import 'package:get/get.dart';


class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}
