import 'package:flutter/material.dart';
import 'package:github_repository_getx/utils/utility.dart';

class EmptyResultMessage extends StatelessWidget {
  const EmptyResultMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.search),
        AppUtility.colSpaceSm,
        AppUtility.normalTextBold("No search result found."),
      ],
    ));
  }
}
