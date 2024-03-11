part of './vl_request.dart';

class VlRequestImpl implements VlRequest {
  final String _basePath;

  const VlRequestImpl({required String basePath}) : _basePath = basePath;

  @override
  Future<ReturnData<dynamic>> post({
    required String path,
    required Object? body,
  }) async {
    try {
      final response = await http.post(Uri.parse('$_basePath/$path'));

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ReturnData(
          success: true,
          message: json.toString(),
          data: json,
        );
      }

      throw ApiException(message: json.toString());
    } catch (e) {
      printInfo(info: e.toString());

      return ReturnData(
        success: false,
        message: e.toString(),
      );
    }
  }

  @override
  Future<ReturnData<dynamic>> get({
    required String path,
    Map<String, dynamic>? params,
  }) async {
    try {
      final listOfParams = params?.entries
              .map((entry) => '${entry.key}=${entry.value}')
              .toList() ??
          [];

      if (listOfParams.isNotEmpty) {
        path = '$path?${listOfParams.join('&')}';
      }

      final response = await http.get(Uri.parse('$_basePath/$path'));

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ReturnData(
          success: true,
          message: json.toString(),
          data: json,
        );
      }

      throw ApiException(message: json.toString());
    } catch (e) {
      printInfo(info: e.toString());

      return ReturnData(
        success: false,
        message: e.toString(),
      );
    }
  }
}
