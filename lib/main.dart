import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:cihan/localization/AppLocal.dart';

import 'package:cihan/scrollbehaivori.dart';
import 'package:cihan/web/screens/home_page.dart';
import 'package:cihan/web/utils/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'localization/kurdish_material_localization.dart';
import 'services/local_storage_service.dart';
import 'services/settings_service_provider.dart';

int cartC = 0;
int role = 0;
bool quickFull = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorageService.instance.init();
  if (LocalStorageService.instance.languageCode == null) {
    LocalStorageService.instance.languageCode = "en";
  }
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (BuildContext context) {
        return SettingsServiceProvider();
      },
      child: Consumer<SettingsServiceProvider>(
        builder: (context, settings, child) {
          return MaterialApp(
              title: 'CIHAN TRANSLATION',
              theme: lightThemeData,
              scrollBehavior: MyCustomScrollBehavior(),
              darkTheme: darkThemeData,
              debugShowCheckedModeBanner: false,
              themeMode: EasyDynamicTheme.of(context).themeMode,
              home: HomePage());
        },
      ),
    );
  }
}
