import 'package:flutter/material.dart';
import 'package:test_app/Screens/ShowData.dart';
import 'package:test_app/Screens/Signup.dart';
import 'package:test_app/utils/root.dart';
import 'Controller/Binding/Binding.dart';
import 'Screens/SignIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'Screens/SocialMedia.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false,
      // home: Login(),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/SignUpPage': (context) => SignUp(),
        '/SocialMedia': (context) => SocialMedia(),
        '/ShowData': (context) => ShowData()
      },
    );
  }
}
