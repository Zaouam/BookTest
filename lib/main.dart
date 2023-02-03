import 'package:bibliotheque/app/main/screens/books_screen.dart';
import 'package:bibliotheque/app/main/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'config/binding/binding.dart';
import 'config/colors/colors.dart';
import 'config/custom_loading_animation.dart';
import 'routes/app_pages.dart';

void main() async {
  configureGlobalLoader();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        initialBinding: Binding(),
        smartManagement: SmartManagement.keepFactory,
        home: HomeScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
  void configureGlobalLoader() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..userInteractions = false
      ..animationStyle = EasyLoadingAnimationStyle.opacity
      ..indicatorColor = Colors.transparent
      ..backgroundColor = Colors.transparent
      ..maskType = EasyLoadingMaskType.black
      ..indicatorColor = Colors.black
      ..textColor = Colors.black
      ..maskColor = Colors.white
      ..contentPadding = EdgeInsets.zero
      ..boxShadow = <BoxShadow>[]
      ..indicatorSize = 0.0
      ..fontSize = 0.0
      ..lineWidth = 0.0
      ..textPadding = EdgeInsets.zero
      ..radius = 0.0
      ..indicatorWidget = const CircularProgressIndicator(color: AppColors.primaryColor,)
      ..progressWidth = 0.0;
  }
