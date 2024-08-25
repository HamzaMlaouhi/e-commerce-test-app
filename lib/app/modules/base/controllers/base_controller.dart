import 'package:get/get.dart';

import '../../../../utils/dummy_helper.dart';
import '../../favorites/controllers/favorites_controller.dart';

class BaseController extends GetxController {

  int currentIndex = 0;

  changeScreen(int selectedIndex) {
    currentIndex = selectedIndex;
    update();
  }

  onFavoriteButtonPressed({required int productId}) {
    var product = DummyHelper.products.firstWhere((product) => product.id == productId);
    if (product.isFavorite!) {
      product.isFavorite = false;
      Get.find<FavoritesController>().getFavoriteProducts();
    } else {
      product.isFavorite = true;
      Get.find<FavoritesController>().getFavoriteProducts();
    }
    update(['FavoriteButton']);
  }

}
