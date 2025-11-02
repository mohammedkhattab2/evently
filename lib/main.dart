import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/provider/language_provider.dart';
import 'package:evently/ui/screens/home/home.dart';
import 'package:evently/ui/screens/splash/splash.dart';
import 'package:evently/ui/provider/theme_provider.dart';
import 'package:evently/ui/utills/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (_) => LanguageProvider(),
  //     child: MyApp()),
  // );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  late LanguageProvider languageProvider;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,

      locale: Locale(languageProvider.currentlanguage),
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      home: const Home(),
    );
  }
}
