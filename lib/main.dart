import 'package:flutter/material.dart';
import 'package:toktik_clean/config/theme/app_theme.dart';
import 'package:toktik_clean/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        routerConfig: appRouter,
    );
  }
}
