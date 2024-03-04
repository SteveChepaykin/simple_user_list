import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_users_list/controllers/appstate_controller.dart';
import 'package:simple_users_list/controllers/https_controller.dart';
import 'package:simple_users_list/controllers/login_controller.dart';
import 'package:simple_users_list/screens/login_screen.dart';
import 'package:simple_users_list/screens/userlist_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppStateController());
  var httpscont = HttpsController();
  var logincont = LoginController();
  await logincont.init();
  Get.put<LoginController>(logincont);
  Get.put<HttpsController>(httpscont);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _sub;

  @override
  void initState() {
    _sub = Get.find<AppStateController>().appState$.listen(eventScreenHandler);
    super.initState();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(),
    );
  }

  void eventScreenHandler(AppEvent event) {
    if (event is LogoutEvent) Get.offAll(() => LoginScreen());
    if (event is LoginEvent) Get.offAll(() => const UserListScreen());
  }
}
