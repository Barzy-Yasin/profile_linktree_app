import 'package:flutter/material.dart';
import 'package:profile_linktree_app/route/screen_routes.dart';

import 'package:profile_linktree_app/src/screens/profile.dart';
import 'package:profile_linktree_app/src/screens/chat.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Profile(),
      initialRoute: ScreenRoutes.init,
      routes: {
        ScreenRoutes.init: (context) => const Profile(),
        ScreenRoutes.chat: (context) =>  const Chat(),
      },
    );
  }
}
