import 'package:get/get.dart';

import '../vl_request/vl_request.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VlRequest>(
      () => const VlRequestImpl(basePath: 'http://192.168.1.106:8080'),
      fenix: true,
    );
  }
}
