import 'package:flutter/material.dart';
import 'package:github_repository_getx/utils/utility.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    required this.userName,
    required this.userUrl,
    required this.avatarUrl,
    this.onTap,
    Key? key,
  }) : super(key: key);
  final String userName;
  final String userUrl;
  final String avatarUrl;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppUtility.edgeInsetsAllSm,
      child: Container(
        padding: AppUtility.edgeInsetsAllSm,
        child: Row(
          children: [
            AppUtility.dashBoardAvatarHolder(
              avatarUrl.isEmpty
                  ? const FlutterLogo()
                  : CircleAvatar(backgroundImage: NetworkImage(avatarUrl)),
            ),
            AppUtility.rowSpaceSm,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppUtility.titleLabel(userName),
                AppUtility.linkText(userUrl)
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: onTap,
              child: const Icon(
                Icons.arrow_right,
                color: Colors.blue,
                size: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
