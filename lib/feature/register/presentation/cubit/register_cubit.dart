import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/networking/api_result.dart';
import 'package:task_app/feature/register/data/models/register_request_model.dart';
import 'package:task_app/feature/register/data/repo/register_repo.dart';
import 'package:task_app/feature/register/presentation/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(const RegisterState(status: Status.initial));

  Future<void> register(RegisterRequestModel registerModel) async {
    emit(state.copyWith(status: Status.loading));
    final response = await _registerRepo.register(registerModel);
    switch (response) {
      case Success<dynamic>(data: final message):
        emit(state.copyWith(status: Status.success, message: message.toString()));
      case Error<dynamic>(error: final error):
        emit(state.copyWith(status: Status.error, message: error.toString()));
    }
  }
}
