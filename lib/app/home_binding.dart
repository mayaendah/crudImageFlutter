import 'package:get/get.dart';
import 'package:uploadimage1/app/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }

}