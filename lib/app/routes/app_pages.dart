import 'package:get/get.dart';

import 'package:amul_galasy/app/modules/about_us/bindings/about_us_binding.dart';
import 'package:amul_galasy/app/modules/about_us/views/about_us_view.dart';
import 'package:amul_galasy/app/modules/home_page/bindings/home_page_binding.dart';
import 'package:amul_galasy/app/modules/home_page/views/home_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => AboutUsView(),
      binding: AboutUsBinding(),
    ),
  ];
}
