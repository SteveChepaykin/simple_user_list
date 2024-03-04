import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_users_list/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController logincont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('LOGIN'),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: logincont,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Get.find<LoginController>().changeLoginStatus(logincont.text);
              },
              child: const Center(
                child: Text('lets go!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
