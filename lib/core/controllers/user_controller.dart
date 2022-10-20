import 'dart:convert';

import 'package:get/get.dart';
import 'package:github_repository_getx/models/error_message.dart';
import 'package:github_repository_getx/models/repository_response.dart';
import 'package:github_repository_getx/models/user_collection.dart';
import 'package:github_repository_getx/models/user_response.dart';
import 'package:github_repository_getx/utils/constants/route_constant.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  String? userName;
  UserResponse? userResponse;
  List<UserCollection> followers = <UserCollection>[].obs;
  List<UserCollection> following = <UserCollection>[].obs;
  List<RepositoryResponse> repos = <RepositoryResponse>[].obs;

  ErrorMessage? errorMessage;

  UserCollection? userFile;
  var isLoading = false.obs;
  var hasError = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getParam();
  }

  getParam() async {
    userName = await Get.arguments;
    await getUserDetail(userName!);
    await getUserRepository(userName!);
    await getUserFollower(userName!);
    await getUserFollowing(userName!);
    // print(Get.arguments);
    // print(Get.parameters);
  }

  allCall(String name) async {
    await getUserDetail(name);
    await getUserRepository(name);
    await getUserFollower(name);
    await getUserFollowing(name);
  }

  getUserDetail(String user) async {
    try {
      hasError(false);
      isLoading(true);
      http.Response response = await http.get(Uri.parse(
          "${RouteConstant.baseUrl}${RouteConstant.userEndpoint}/$user"));
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        userResponse = UserResponse.fromJson(res);
      } else {
        hasError(true);
        var res = jsonDecode(response.body);
        errorMessage = ErrorMessage.fromJson(res);
      }
    } catch (e) {
      hasError(true);
      ErrorMessage;
    } finally {
      isLoading(false);
    }
  }

  getUserRepository(String user) async {
    try {
      hasError(false);
      isLoading(true);
      http.Response response = await http.get(Uri.parse(
          "${RouteConstant.baseUrl}${RouteConstant.userEndpoint}/$user${RouteConstant.repoEndPoint}"));
      if (response.statusCode == 200) {
        repos = repositoryResponseFromJson(response.body);
      } else {
        hasError(true);
        var res = jsonDecode(response.body);
        errorMessage = ErrorMessage.fromJson(res);
      }
    } catch (e) {
      hasError(true);
      ErrorMessage;
    } finally {
      isLoading(false);
    }
  }

  getUserFollower(String user) async {
    try {
      hasError(false);
      isLoading(true);
      http.Response response = await http.get(Uri.parse(
          "${RouteConstant.baseUrl}${RouteConstant.userEndpoint}/$user${RouteConstant.flwrsEndPoint}"));
      if (response.statusCode == 200) {
        followers = userCollectionFromJson(response.body);
      } else {
        hasError(true);
        var res = jsonDecode(response.body);
        errorMessage = ErrorMessage.fromJson(res);
      }
    } catch (e) {
      hasError(true);
      ErrorMessage;
    } finally {
      isLoading(false);
    }
  }

  getUserFollowing(String user) async {
    try {
      hasError(false);
      isLoading(true);
      http.Response response = await http.get(Uri.parse(
          "${RouteConstant.baseUrl}${RouteConstant.userEndpoint}/$user${RouteConstant.flwngEndPoint}"));
      if (response.statusCode == 200) {
        following = userCollectionFromJson(response.body);
      } else {
        hasError(true);
        var res = jsonDecode(response.body);
        errorMessage = ErrorMessage.fromJson(res);
      }
    } catch (e) {
      hasError(true);
      ErrorMessage;
    } finally {
      isLoading(false);
    }
  }
}
