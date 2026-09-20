import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/core/networking/api_constants.dart';
import 'package:task_app/core/networking/api_error_handler.dart';
import 'package:task_app/core/networking/api_result.dart';
import 'package:task_app/feature/register/data/models/register_request_model.dart';

class RegisterRepo {
  final Dio _dio;
  RegisterRepo(this._dio);

  Future<ApiResult<dynamic>> register(
      RegisterRequestModel registerModel) async {
    try {
      final response = await _dio.post(
        ApiConstants.register,
        data: registerModel.toJson(),
      );
      await _saveToken(response.data['data']['token']);
      return Success(response.data['message']);
    } on DioException catch (e) {
      return Error(ApiErrorHandler.handle(e).message);
    }
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
