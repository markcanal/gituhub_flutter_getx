import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:github_repository_getx/models/error_message.dart';
import 'package:github_repository_getx/utils/constants/route_constant.dart';
import 'package:github_repository_getx/models/user_collection.dart';
import 'package:http/http.dart' as http;

class DashBoardController extends GetxController {
  List<UserCollection> userCollection = <UserCollection>[];
  List<UserCollection> userFiltered = <UserCollection>[].obs;
  ErrorMessage? errorResponse;
  var isLoading = false.obs;
  var hasError = false.obs;

  TextEditingController userSearchString = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    getUserCollection();
  }

  getUserCollection() async {
    try {
      hasError(false);
      isLoading(true);
      http.Response response =
          await http.get(Uri.parse('${RouteConstant.baseUrl}/users'));

      if (response.statusCode == 200) {
        userCollection = userCollectionFromJson(response.body);
        for (var element in userCollection) {
          userFiltered.add(element);
        }
      } else {
        hasError(true);
        var result = jsonDecode(response.body);
        errorResponse = ErrorMessage.fromJson(result);
        throw ErrorMessage.fromJson(result);
      }
    } catch (e) {
      hasError(true);
      ErrorMessage;
    } finally {
      isLoading(false);
    }
  }

  searchUser(String string) {
    try {
      isLoading(true);
      userFiltered.clear();

      if (string.isEmpty) {
        for (var element in userCollection) {
          userFiltered.add(element);
        }
      } else {
        // userCollection.where((element) => element.login == string);
        // userFiltered
        //     .addAll(userCollection.contains(string.toLowerCase()));
        userFiltered.addAll(userCollection.where((element) =>
            element.login == string || element.login!.contains(string, 0)));
      }
    } catch (e) {
      ErrorMessage;
    } finally {
      isLoading(false);
    }
  }
}
