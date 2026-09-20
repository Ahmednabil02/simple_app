import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/di/service_locator.dart';
import 'package:task_app/core/routes/app_routes.dart';
import 'package:task_app/feature/home/presentation/ui/home_screen.dart';
import 'package:task_app/feature/register/presentation/cubit/register_cubit.dart';
import 'package:task_app/feature/register/presentation/ui/register_screen.dart';

class AppRouter {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(getIt()),
            child: const RegisterScreen(),
          ),
        );

      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return null;
    }
  }
}
