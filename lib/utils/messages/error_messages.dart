import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_repository_getx/core/controllers/dashboard_controller.dart';
import 'package:github_repository_getx/utils/utility.dart';

class ErrorResponse extends StatefulWidget {
  ErrorResponse({required this.storeController, super.key});
  DashBoardController storeController = Get.put(DashBoardController());

  @override
  State<ErrorResponse> createState() => _ErrorResponseState();
}

class _ErrorResponseState extends State<ErrorResponse> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: Colors.red,
              size: 40,
            ),
            Padding(
              padding: AppUtility.edgeInsetsAllSm,
              child: AppUtility.normalTextBold(
                widget.storeController.errorResponse != null
                    ? widget.storeController.errorResponse!.message.toString()
                    : "Error Occured",
              ),
            )
          ],
        ),
      ),
    );
  }
}
