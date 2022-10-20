import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_repository_getx/core/controllers/tab_controller.dart';
import 'package:github_repository_getx/core/controllers/user_controller.dart';
import 'package:github_repository_getx/screens/widget/user/header_info.dart';
import 'package:github_repository_getx/utils/loading_progress.dart';
import 'package:github_repository_getx/utils/messages/error_message_user.dart';
import 'package:github_repository_getx/utils/messages/error_messages.dart';
import 'package:github_repository_getx/utils/messages/shimmer_user_details.dart';
import 'package:github_repository_getx/utils/utility.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  UserController userController = Get.put(UserController());

  final UserTabController _tabController = Get.put(UserTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => userController.isLoading.value
            ? const UserDetailShimmer() // LoadingProgress()
            : Obx(
                () => userController.hasError.value
                    ? const ErrorResponseUser()
                    : ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          userController.userResponse != null
                              ? HeaderInfo(
                                  userName: userController.userResponse!.login!,
                                  userUrl:
                                      userController.userResponse!.htmlUrl!,
                                  url: userController.userResponse!.avatarUrl!,
                                  gistCount: userController
                                      .userResponse!.publicGists!
                                      .toString(),
                                  followerCount: userController
                                      .userResponse!.followers!
                                      .toString(),
                                  followingCount: userController
                                      .userResponse!.following!
                                      .toString(),
                                )
                              : Container(),
                          AppUtility.colSpaceSm,
                          Padding(
                            padding: AppUtility.paddingHorizontal,
                            child: TabBar(
                                controller: _tabController.tabController,
                                unselectedLabelColor: Colors.black,
                                indicator: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(25),
                                    // ignore: prefer_const_literals_to_create_immutables
                                    boxShadow: [
                                      const BoxShadow(
                                          offset: Offset(0.0, 0.5),
                                          blurRadius: 0.5,
                                          spreadRadius: 0.2)
                                    ]),
                                labelColor: Colors.white,
                                tabs: _tabController.tabs),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.44,
                            child: TabBarView(
                              physics: const BouncingScrollPhysics(),
                              controller: _tabController.tabController,
                              children: _tabController.pages.map<Widget>((e) {
                                return e;
                              }).toList(),
                            ),
                          )
                        ],
                      ),
              ),
      ),
    );
  }
}
