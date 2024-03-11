import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../exceptions/api_exception.dart';
import 'return_data.dart';

part 'vl_request_impl.dart';

abstract interface class VlRequest {
  Future<ReturnData<dynamic>> post({
    required String path,
    required Object? body,
  });
  Future<ReturnData<dynamic>> get({
    required String path,
    Map<String, dynamic>? params,
  });
}
