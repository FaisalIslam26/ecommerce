import 'package:ecommerce/signin.dart';
import 'package:ecommerce/signup.dart';
import 'package:ecommerce/user_data.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ecommerce app",
      initialRoute: SignInScreen.path,
      routes: {
        SignInScreen.path: (ctx) => SignInScreen(),
        SignUpScreen.path: (ctx) => SignUpScreen(),
        UserdataScreen.path: (ctx) => UserdataScreen(),
      },
    );
  }
}
