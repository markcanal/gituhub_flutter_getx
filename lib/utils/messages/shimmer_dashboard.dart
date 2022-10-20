import 'package:flutter/material.dart';
import 'package:github_repository_getx/screens/widget/dashboard/dashboard_user_tile.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDashBoard extends StatelessWidget {
  const ShimmerDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.blue,
      highlightColor: Colors.white,
      child: ListView(
        children: shimSkeleton(),
      ),
    );
  }

  shimSkeleton() => List.generate(
      6, (index) => const UserTile(userName: "", userUrl: "", avatarUrl: ""));
}
