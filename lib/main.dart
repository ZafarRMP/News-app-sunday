import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app1/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru'),
        Locale('uz'),
        Locale('en'),
      ],
      path: 'assets/translations',
      saveLocale: true,
      fallbackLocale: const Locale('ru'),
      child: const MyApp(),
    ),
  );
}
