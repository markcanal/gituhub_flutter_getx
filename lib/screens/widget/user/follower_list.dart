import 'package:flutter/material.dart';
import 'package:github_repository_getx/core/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:github_repository_getx/screens/widget/dashboard/dashboard_user_tile.dart';
import 'package:github_repository_getx/utils/utility.dart';

class FollowerList extends StatelessWidget {
  FollowerList({super.key});
  final UserController _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: AppUtility.paddingVertical,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _userController.followers.length,
            itemBuilder: (context, index) {
              return UserTile(
                userName: _userController.followers[index].login!,
                userUrl: _userController.followers[index].htmlUrl!,
                avatarUrl: _userController.followers[index].avatarUrl!,
                onTap: () {
                  _userController
                      .allCall(_userController.followers[index].login!);
                  // var parameters = <String, String>{
                  //   "users": _userController.followers[index].login!
                  // };
                  // Get.offNamed(RouteConstant.flwngEndPoint,
                  //     arguments: _userController.followers[index].login!,
                  //     parameters: parameters);
                },
              );
            }));
  }
}
