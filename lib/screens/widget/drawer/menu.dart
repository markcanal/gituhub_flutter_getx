import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_repository_getx/utils/utility.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: AppUtility.titleLabel("Sample Feature Flags")),
            Row(
              children: [
                AppUtility.normalText("User Profile"),
                Checkbox(value: false, onChanged: (f) {}),
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: AppUtility.normalText("Save"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
