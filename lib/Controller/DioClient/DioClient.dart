import 'dart:io';
import 'package:dio/dio.dart';

import 'logging_interceptor.dart';



class DioClient {
  late Dio dio;
  final String baseUrl;

  DioClient(
    this.baseUrl,
  ) {
    LoggingInterceptor loggingInterceptor = new LoggingInterceptor();
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 42000000,
      receiveTimeout: 42000000,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
    dio
      ..options.responseType = ResponseType.plain
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 50000
      ..options.receiveTimeout = 50000
      ..options.validateStatus = (status) {
        return status! < 500;
      }
      ..httpClientAdapter
      ..options.headers = <String, String>{
        'Accept': 'application/json',
      }
      ..options.contentType = 'application/json';

    dio.interceptors.add(loggingInterceptor);
  }

  Future<Response> get(
    String uri,
    {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    print(data);
    print(uri);
    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> postData(
    String uri,
    String token,
    String body, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.post(
        uri,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          contentType: 'application/json',
          receiveTimeout: 50000,
          sendTimeout: 50000,
        ),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> put(
    String uri,
    String token,
    String body, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.put(
        uri,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          contentType: 'application/json',
          receiveTimeout: 50000,
          sendTimeout: 50000,
        ),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    token,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          contentType: 'application/json',
          receiveTimeout: 50000,
          sendTimeout: 50000,
        ),
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }
}
