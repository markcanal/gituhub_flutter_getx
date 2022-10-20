import 'package:flutter/material.dart';
import 'package:github_repository_getx/core/controllers/user_controller.dart';

import 'package:get/get.dart';

import 'package:github_repository_getx/utils/utility.dart';

class RepositoryList extends StatefulWidget {
  const RepositoryList({super.key});

  @override
  State<RepositoryList> createState() => _RepositoryListState();
}

class _RepositoryListState extends State<RepositoryList> {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtility.paddingVertical,
      child: ListView.builder(
        padding: AppUtility.edgeInsetsAllSm,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: userController.repos.length,
        itemBuilder: (context, index) {
          return ReposCard(
            userController: userController,
            index: index,
          );
        },
      ),
    );
  }
}

class ReposCard extends StatelessWidget {
  const ReposCard({
    required this.index,
    Key? key,
    required this.userController,
  }) : super(key: key);

  final UserController userController;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Card(
              child: Padding(
            padding: AppUtility.edgeInsetsAllSm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.computer),
                    AppUtility.rowSpaceM,
                    Flexible(
                      child: AppUtility.titleLabel(
                          userController.repos[index].name!,
                          colors: Colors.blue),
                    ),
                  ],
                ),
                AppUtility.colSpaceSm,
                userController.repos[index].description != null
                    ? AppUtility.informativeRow("Description :",
                        userController.repos[index].description!)
                    : const SizedBox.shrink(),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
