import 'package:get/get.dart';
import 'package:github_repository_getx/core/binding/dashboard_binding.dart';
import 'package:github_repository_getx/screens/user_details.dart';
import 'package:github_repository_getx/utils/constants/route_constant.dart';
import 'package:github_repository_getx/main.dart';

List<GetPage> getPages = [
  GetPage(
      name: RouteConstant.home,
      page: () => const Home(),
      binding: DashboardBinding()),
  GetPage(
      name: RouteConstant.userEndpoint,
      page: () => const UserDetails(),
      binding: DashboardBinding()),
  GetPage(
      name: RouteConstant.flwngEndPoint,
      page: () => const UserDetails(),
      binding: DashboardBinding()),
  GetPage(
      name: RouteConstant.flwrsEndPoint,
      page: () => const UserDetails(),
      binding: DashboardBinding())
];
