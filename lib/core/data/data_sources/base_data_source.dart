import 'package:dio/dio.dart';
import 'package:natural_groceries/core/data/models/base/base_inmar_ice_model.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/utilities/l10n/l10n_service.dart';
import 'package:natural_groceries/core/data/utilities/log/logger_service.dart';
import 'package:retrofit/retrofit.dart';

mixin BaseDataSource {
  Future<BaseResponse<BaseModel<T>>> getResult<T>(
    Future<HttpResponse<BaseModel<T>>> Function() call,
  ) async {
    try {
      final response = await call.call();

      final statusCode = response.response.statusCode ?? -1;
      if (statusCode == -1) {
        return const BaseResponse.error(
          message: 'Unknown Error',
        );
      }
      if (statusCode >= 200 && statusCode < 300) {
        final body = response.data;
        if (body.status) {
          return BaseResponse.success(data: body);
        } else {
          return BaseResponse.error(
            message: body.message ?? '',
          );
        }
      } else {
        return BaseResponse.error(
          message: response.response.statusMessage ?? 'Unknown Error',
        );
      }
    } on DioError catch (e, s) {
      LoggerService().d('Error is $e, stack $s');
      if (e.type == DioErrorType.connectionTimeout || e.type == DioErrorType.receiveTimeout) {
        return const BaseResponse.error(
          message: 'Connection time out.',
        );
      } else if (e.type == DioErrorType.badResponse) {
        return const BaseResponse.error(
          message: 'Check your internet connection',
        );
      } else {
        // ignore: prefer_const_constructors
        return BaseResponse.error(
          message: AppLocale.current.something_went_wrong,
        );
      }
    } catch (e, s) {
      LoggerService().d('Error is $e, stack $s');
      return BaseResponse.error(
        message: e.toString(),
      );
    }
  }

  Future<BaseResponse<T>> getResultOf<T>(
    Future<HttpResponse<T>> Function() call,
  ) async {
    try {
      final response = await call();

      final statusCode = response.response.statusCode ?? -1;
      if (statusCode == -1) {
        return const BaseResponse.error(
          message: 'Unknown Error',
        );
      }
      if (statusCode >= 200 && statusCode < 300) {
        final body = response.data;
        return BaseResponse.success(data: body);
      } else {
        return BaseResponse.error(
          message: response.response.statusMessage ?? 'Unknown Error',
        );
      }
    } catch (e, s) {
      LoggerService().d('Error is $e, stack $s');
      return BaseResponse.error(
        message: AppLocale.current.something_went_wrong,
      );
    }
  }

  Future<BaseResponse<T>> getResultInmarIce<T extends BaseInmarIceModel>(
    Future<HttpResponse<T>> Function() call,
  ) async {
    try {
      final response = await call();

      final statusCode = response.response.statusCode ?? -1;
      if (statusCode == -1) {
        return const BaseResponse.error(
          message: 'Unknown Error',
        );
      }
      if (statusCode >= 200 && statusCode < 300) {
        final body = response.data;
        if (body.status == null) {
          return BaseResponse.success(data: body);
        } else {
          return BaseResponse.error(
            message: body.message ?? '',
          );
        }
      } else {
        return BaseResponse.error(
          message: response.response.statusMessage ?? 'Unknown Error',
        );
      }
    } catch (e, s) {
      LoggerService().d('Error is $e, stack $s');
      return BaseResponse.error(
        message: AppLocale.current.something_went_wrong,
      );
    }
  }
}
