import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/core/di/service_locator.dart';
import 'package:task_app/task_app.dart';

String? token;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  token = prefs.getString('token');
  await setupGetIt();
  runApp(const TaskApp());
}
