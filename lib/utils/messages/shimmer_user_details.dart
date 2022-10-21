import 'package:flutter/material.dart';
import 'package:github_repository_getx/screens/widget/dashboard/dashboard_user_tile.dart';

import 'package:github_repository_getx/screens/widget/user/header_info.dart';
import 'package:github_repository_getx/utils/utility.dart';
import 'package:shimmer/shimmer.dart';

class UserDetailShimmer extends StatelessWidget {
  const UserDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.blue,
      highlightColor: Colors.white,
      child: ListView(
        children: [
          const HeaderInfo(
              url: "url",
              userName: "userName",
              userUrl: "userUrl",
              gistCount: "gistCount",
              followerCount: "followerCount",
              followingCount: "followingCount"),
          AppUtility.colSpaceSm,
          Row(
            children: [
              AppUtility.rowSpaceSm,
              Container(
                padding: AppUtility.paddingHorizontal,
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                          offset: Offset(0.0, 0.5),
                          blurRadius: 0.5,
                          spreadRadius: 0.2)
                    ]),
              ),
              AppUtility.rowSpaceSm,
              Container(
                padding: AppUtility.paddingHorizontal,
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                          offset: Offset(0.0, 0.5),
                          blurRadius: 0.5,
                          spreadRadius: 0.2)
                    ]),
              ),
              AppUtility.rowSpaceSm,
              Container(
                padding: AppUtility.paddingHorizontal,
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                          offset: Offset(0.0, 0.5),
                          blurRadius: 0.5,
                          spreadRadius: 0.2)
                    ]),
              ),
            ],
          ),
          ...List.generate(
              4,
              (index) => const UserTile(
                  userName: "userName", userUrl: "userUrl", avatarUrl: ''))
        ],
      ),
    );
  }
}
