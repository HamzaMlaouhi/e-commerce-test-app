part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const BASE = _Paths.BASE;
  static const HOME = _Paths.HOME;
  static const FAVORITES = _Paths.FAVORITES;
  static const CART = _Paths.CART;
  static const NOTIFICATIONS = _Paths.NOTIFICATIONS;
  static const SETTINGS = _Paths.SETTINGS;
  static const PRODUCT_DETAILS = _Paths.PRODUCT_DETAILS;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const BASE = '/base';
  static const HOME = '/home';
  static const FAVORITES = '/favorites';
  static const CART = '/cart';
  static const NOTIFICATIONS = '/notifications';
  static const SETTINGS = '/settings';
  static const PRODUCT_DETAILS = '/product-details';
}
