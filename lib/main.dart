import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/global_keys.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/screens/home.dart';
import 'package:movie/theme/styles.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('de', 'DE')],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CommonProvider()),
        ],
        child: MaterialApp(
            navigatorKey: MyGlobalKeys.navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Movie',
            home: HomePage()));
  }
}
