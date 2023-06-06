import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/utilities/api/auth_api.dart';
import 'package:natural_groceries/core/data/utilities/api/content_api.dart';
import 'package:natural_groceries/core/data/utilities/api/user_api.dart';
import 'package:natural_groceries/core/data/utilities/api/interceptors/logging_interceptor.dart';

/// Api Provider
@injectable
class Api {
  /// Default constructor
  Api();

  final _dio = Dio(
    BaseOptions(
      receiveTimeout: const Duration(milliseconds: 60000),
      connectTimeout: const Duration(milliseconds: 60000),
      contentType: 'application/json',
    ),
  )
    ..interceptors.add(
      LoggingInterceptor(),
    )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions options,
          RequestInterceptorHandler handler,
        ) async {
          options.headers['Content-Type'] = 'application/json';
          options.queryParameters['_format'] = 'json';
          return handler.next(options);
        },
      ),
    );

  final _baseUrl = 'https://ng-api.politewater-a8cc60a5.northcentralus.azurecontainerapps.io';

  AuthApi get auth => AuthApi(_dio, baseUrl: _baseUrl);

  UserApi get user => UserApi(_dio, baseUrl: _baseUrl);

  ContentApi get content => ContentApi(_dio, baseUrl: _baseUrl);
}
