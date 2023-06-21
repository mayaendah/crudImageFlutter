import 'package:get/get.dart';
import '../home_binding.dart';
import '../home_view.dart';
import '../load_image.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static const IMAGE=Routes.LOADIMAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.LOADIMAGE, page: () => LoadImage(), binding: HomeBinding())
  ];
}
