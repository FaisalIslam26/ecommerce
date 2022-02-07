import 'package:ecommerce/bottom_nav_pages/added_to_cart.dart';
import 'package:ecommerce/signin.dart';
import 'package:ecommerce/signup.dart';
import 'package:ecommerce/splash_screen.dart';
import 'package:ecommerce/user_data.dart';
import 'package:ecommerce/product_details.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}
