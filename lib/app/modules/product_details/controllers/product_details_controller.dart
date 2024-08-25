import 'package:get/get.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../data/models/product_model.dart';
import '../../base/controllers/base_controller.dart';
import '../../cart/controllers/cart_controller.dart';

class ProductDetailsController extends GetxController {

  ProductModel product = Get.arguments;

  var selectedSize = 'M';

  onFavoriteButtonPressed() {
    Get.find<BaseController>().onFavoriteButtonPressed(productId: product.id!);
    update(['FavoriteButton']);
  }

  onAddToCartPressed() {
    var mProduct = DummyHelper.products.firstWhere((p) => p.id == product.id);
    mProduct.quantity = mProduct.quantity! + 1;
    mProduct.size = selectedSize;
    Get.find<CartController>().getCartProducts();
    Get.back();
  }

  /// change the selected size
  changeSelectedSize(String size) {
    if (size == selectedSize) return;
    selectedSize = size;
    update(['Size']);
  }

}
