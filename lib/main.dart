import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmortey/Features/Home/view/screens/HomeScreen.dart';
import 'package:rickandmortey/core/utility/routes/app_router.dart';
import 'package:rickandmortey/theme.dart';

void main() {
  runApp(rickandmortey());
}

class rickandmortey extends StatelessWidget {
  const rickandmortey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'property app',
      initialRoute: '/',
      getPages: AppRouter.routes,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}
