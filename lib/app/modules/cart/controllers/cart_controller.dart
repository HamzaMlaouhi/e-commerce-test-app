import 'package:get/get.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../components/custom_snackbar.dart';
import '../../../data/models/product_model.dart';
import '../../base/controllers/base_controller.dart';

class CartController extends GetxController {

  List<ProductModel> products = [];

  var total = 0.0;
  
  @override
  void onInit() {
    getCartProducts();
    super.onInit();
  }

  onPurchaseNowPressed() {
    Get.find<BaseController>().changeScreen(0);
    CustomSnackBar.showCustomSnackBar(
      title: 'Purchased',
      message: 'Order placed with success'
    );
  }

  onIncreasePressed(int productId) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    product.quantity = product.quantity! + 1;
    getCartProducts();
    update(['ProductQuantity']);
  }

  onDecreasePressed(int productId) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    if (product.quantity != 0) {
      product.quantity = product.quantity! - 1;
      getCartProducts();
      update(['ProductQuantity']);
    }
  }

  onDeletePressed(int productId) {
    var product = DummyHelper.products.firstWhere((p) => p.id == productId);
    product.quantity = 0;
    getCartProducts();
  }

  getCartProducts() {
    products = DummyHelper.products.where((p) => p.quantity! > 0).toList();
    total = products.fold<double>(0, (p, c) => p + c.price! * c.quantity!);
    update();
  }
  
}
