import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rickandmortey/Features/Home/view/screens/HomeScreen.dart';
import 'package:rickandmortey/Features/detailsScreen/view/screens/details_screen.dart';

class AppRouter {
  static const animationDuration = Duration(milliseconds: 600);

  static List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => HomeScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: '/DetailsScreen',
      page: () => DetailsScreen(),
      transition: Transition.leftToRight,
    ),
  ];
}
