import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './utils/theme_data.dart';
import './view/main_root.dart';
import './viewmodel/category_view_model.dart';
import './viewmodel/product_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoryViewModel()..getAllCategories(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductViewModel()..getAllProducts(),
        ),
      ],
      child: EasyLocalization(
          path: 'assets/translations',
          fallbackLocale: const Locale('en', 'US'),
          supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
          child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coding Challenge',
        theme: myTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: MainRoot(),
      );
}
