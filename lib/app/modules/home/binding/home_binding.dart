import 'package:get/get.dart';

import '../../../core/vl_request/vl_request.dart';
import '../controller/home_controller.dart';
import '../service/home_service.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeService>(HomeServiceImpl(vlRequest: Get.find<VlRequest>()));
    Get.put(HomeController(service: Get.find<HomeService>()));
  }
}
