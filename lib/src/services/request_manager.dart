import 'package:dio/dio.dart';
import '../model/request_response/response.dart' as bui;

class RequestManager {
  RequestManager({String? baseUrl, Map<String, String>? headers}) {
    _dio.options.baseUrl = baseUrl ?? '';
    _dio.options.headers.addAll(headers ?? {});
  }

  final Dio _dio = Dio();

  Future<bui.Response> post(
    String path, {
    required Object body,
    Map<String, String>? headers,
    Function(int, int)? onReceiveProgress,
    Function(int, int)? onSendProgress,
  }) async {
    try {
      Response response = await _dio.post(path,
          data: body,
          options: Options(headers: headers),
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress);

      return bui.Response(
        body: response.data,
        statusCode: response.statusCode,
      );
    } catch (e) {
      if (e is DioError) {
        Response? response = e.response;
        return bui.Response(
            body: response?.data, statusCode: response?.statusCode);
      }
      rethrow;
    }
  }

  Future<bui.Response> get(
    String path, {
    required Object body,
    Map<String, String>? headers,
    Function(int, int)? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.get(
        path,
        data: body,
        options: Options(headers: headers),
        onReceiveProgress: onReceiveProgress,
      );

      return bui.Response(
        body: response.data,
        statusCode: response.statusCode,
      );
    } catch (e) {
      if (e is DioError) {
        Response? response = e.response;
        return bui.Response(
            body: response?.data, statusCode: response?.statusCode);
      }
      rethrow;
    }
  }
}
