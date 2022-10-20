import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_repository_getx/screens/widget/user/follower_list.dart';
import 'package:github_repository_getx/screens/widget/user/following_list.dart';
import 'package:github_repository_getx/screens/widget/user/repository_list.dart';
import 'package:github_repository_getx/utils/utility.dart';

class UserTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(
      child: AppUtility.normalTextBold("Repositories"),
    ),
    Tab(
      child: AppUtility.normalTextBold("Followers"),
    ),
    Tab(
      child: AppUtility.normalTextBold("Following"),
    )
  ];
  final List<Widget> pages = <Widget>[
    const RepositoryList(),
    FollowerList(),
    FollowingList()
  ];
  var index = 0.obs;
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}
