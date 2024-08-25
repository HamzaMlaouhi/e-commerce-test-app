import 'package:get/get.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../data/models/product_model.dart';

class FavoritesController extends GetxController {

  List<ProductModel> products = [];
  
  @override
  void onInit() {
    getFavoriteProducts();
    super.onInit();
  }

  getFavoriteProducts() {
    products = DummyHelper.products.where((product) => product.isFavorite!).toList();
    update();
  }
}
