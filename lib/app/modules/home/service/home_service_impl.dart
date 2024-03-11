part of 'home_service.dart';

class HomeServiceImpl implements HomeService {
  final VlRequest _vlRequest;

  const HomeServiceImpl({
    required VlRequest vlRequest,
  }) : _vlRequest = vlRequest;

  @override
  Future<ReturnData<List<UserModel>>> getUsers() async {
    try {
      final response = await _vlRequest.get(path: 'users');

      return ReturnData(
        success: response.success,
        message: response.message,
        data: response.success
            ? response.data
                .map<UserModel>(
                  (e) => UserModel.fromMap(e),
                )
                .toList()
            : null,
      );
    } catch (e) {
      printInfo(info: e.toString());

      return ReturnData(
        success: false,
        message: e.toString(),
      );
    }
  }
}
