import 'package:flutter/material.dart';
import 'package:github_repository_getx/utils/constants/route_constant.dart';
import 'package:github_repository_getx/utils/utility.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({
    required this.url,
    required this.userName,
    required this.userUrl,
    required this.gistCount,
    required this.followerCount,
    required this.followingCount,
    Key? key,
  }) : super(key: key);

  final String url;
  final String userName;
  final String userUrl;
  final String gistCount;
  final String followerCount;
  final String followingCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const Image(image: NetworkImage(banner, scale: 0.5)),
            Positioned(
              bottom: 0,
              left: MediaQuery.of(context).size.width * 0.08,
              child: AppUtility.userAvatarHolder(
                CircleAvatar(
                  backgroundImage: NetworkImage(url),
                ),
              ),
            ),
          ],
        ),
        AppUtility.colSpaceSm,
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: AppUtility.edgeInsetsAllSm,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(child: AppUtility.titleLabel(userName)),
                            Flexible(
                              child: AppUtility.linkText(userUrl),
                            ),
                            Flexible(
                                child: AppUtility.informativeRow(
                                    "Gist : ", gistCount))
                          ],
                        ),
                      ),
                      AppUtility.rowSpaceM,
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: AppUtility.informativeRow(
                                  "Followers : ", followerCount),
                            ),
                            Flexible(
                              child: AppUtility.informativeRow(
                                  "Following : ", followingCount),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
