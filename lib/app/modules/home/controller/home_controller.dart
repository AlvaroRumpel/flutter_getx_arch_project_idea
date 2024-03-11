import 'package:get/get.dart';

import '../../../models/user_model.dart';
import '../service/home_service.dart';

class HomeController extends SuperController<List<UserModel>> {
  final HomeService _service;

  HomeController({required HomeService service}) : _service = service;

  @override
  void onReady() {
    super.onReady();

    getUsers();
  }

  Future<void> getUsers() async {
    change([], status: RxStatus.loading());
    
    final result = await _service.getUsers();

    if (result.success) {
      change(result.data!, status: RxStatus.success());

      return;
    }

    change([], status: RxStatus.error(result.message));
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
