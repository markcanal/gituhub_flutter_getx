import 'package:flutter/material.dart';
import 'package:github_repository_getx/core/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:github_repository_getx/screens/widget/dashboard/dashboard_user_tile.dart';
import 'package:github_repository_getx/utils/utility.dart';

class FollowingList extends StatelessWidget {
  FollowingList({super.key});
  final UserController _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtility.paddingVertical,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _userController.following.length,
        itemBuilder: (context, index) {
          return UserTile(
              userName: _userController.following[index].login!,
              userUrl: _userController.following[index].htmlUrl!,
              avatarUrl: _userController.following[index].avatarUrl!,
              onTap: () {
                _userController
                    .allCall(_userController.following[index].login!);
              });
        },
      ),
    );
  }
}
