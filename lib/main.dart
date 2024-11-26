import 'package:flutter/material.dart';
import 'package:pojok_iot/core/route/app_route.dart';
import 'package:pojok_iot/core/route/app_route_name.dart';
import 'package:pojok_iot/core/theme/app_theme.dart';

/// Follow me on
/// Youtube : Dannndi
/// IG : dannndi.ig
/// Tiktok : dannndi.tt
///
/// Like & Subscribe

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Food Recipe",
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      initialRoute: AppRouteName.getStarted,
      onGenerateRoute: AppRoute.generate,
    );
  }
}
