import 'package:get/get.dart';

import '../modules/home_tree/bindings/home_tree_binding.dart';
import '../modules/home_tree/views/home_tree_view.dart';
import '../modules/library/bindings/library_binding.dart';
import '../modules/library/views/library_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/more/views/more_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME_TREE,
      page: () => HomeTreeView(),
      binding: HomeTreeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.LIBRARY,
      page: () => LibraryView(),
      binding: LibraryBinding(),
    ),
    GetPage(
      name: _Paths.MORE,
      page: () => MoreView(),
      binding: MoreBinding(),
    ),
  ];
}
