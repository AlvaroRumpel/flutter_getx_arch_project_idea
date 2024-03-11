import 'package:get/get.dart';

import '../../../core/vl_request/return_data.dart';
import '../../../core/vl_request/vl_request.dart';
import '../../../models/user_model.dart';

part 'home_service_impl.dart';
abstract interface class HomeService {
  Future<ReturnData<List<UserModel>>> getUsers();
}
