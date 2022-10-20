import 'package:flutter/material.dart';
import 'package:github_repository_getx/core/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:github_repository_getx/utils/utility.dart';

class ErrorResponseUser extends StatefulWidget {
  const ErrorResponseUser({super.key});

  @override
  State<ErrorResponseUser> createState() => _ErrorResponseUserState();
}

class _ErrorResponseUserState extends State<ErrorResponseUser> {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
          ),
          Text(
            userController.errorMessage!.message.toString(),
            style: AppUtility.labelText,
          )
        ],
      ),
    );
  }
}
