import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_repository_getx/core/controllers/dashboard_controller.dart';
import 'package:github_repository_getx/screens/widget/dashboard/dashboard_user_tile.dart';
import 'package:github_repository_getx/utils/constants/route_constant.dart';
import 'package:github_repository_getx/utils/loading_progress.dart';

import 'package:github_repository_getx/utils/messages/empty_message.dart';
import 'package:github_repository_getx/utils/messages/error_messages.dart';
import 'package:github_repository_getx/utils/utility.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
    required this.dashboardController,
  }) : super(key: key);

  final DashBoardController dashboardController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: AppUtility.edgeInsetsAllSm,
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Users',
            ),
            controller: dashboardController.userSearchString,
            onChanged: (value) =>
                value.isEmpty ? dashboardController.searchUser('') : null,
            onSubmitted: (value) => dashboardController.searchUser(value),
          ),
        ),
        Expanded(
          child: Obx(
            () => dashboardController.isLoading.value
                ? const LoadingProgress()
                : Obx(
                    () => dashboardController.hasError.value
                        ? ErrorResponse(
                            storeController: dashboardController,
                          )
                        : Obx(
                            () => dashboardController.userFiltered.isEmpty
                                ? const EmptyResultMessage()
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount:
                                        dashboardController.userFiltered.length,
                                    itemBuilder: (context, index) {
                                      return dashboardController
                                              .userFiltered.isNotEmpty
                                          ? UserTile(
                                              userName: dashboardController
                                                  .userFiltered[index].login!,
                                              userUrl: dashboardController
                                                  .userFiltered[index].htmlUrl!,
                                              avatarUrl: dashboardController
                                                  .userFiltered[index]
                                                  .avatarUrl!,
                                              onTap: () {
                                                var parameters =
                                                    <String, String>{
                                                  "user": dashboardController
                                                      .userFiltered[index]
                                                      .login!
                                                };
                                                Get.toNamed(
                                                    RouteConstant.userEndpoint,
                                                    arguments:
                                                        dashboardController
                                                            .userFiltered[index]
                                                            .login!,
                                                    parameters: parameters);
                                              },
                                            )
                                          : const Text("No Data");
                                    },
                                  ),
                          ),
                  ),
          ),
        )
      ],
    );
  }
}
