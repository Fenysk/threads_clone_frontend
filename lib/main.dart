import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:threads_clone/core/configs/theme/theme.config.dart';
import 'package:threads_clone/features/skeleton/3_presentation/page/skeleton.page.dart';
import 'package:threads_clone/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load();
  } catch (error) {
    print('Error loading .env file: $error');
  }

  setupServiceLocator();

  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Threads Clone',
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        GlobalMaterialLocalizations.delegate,
      ],
      themeMode: ThemeMode.system,
      theme: AppThemeConfig.lightTheme,
      darkTheme: AppThemeConfig.darkTheme,
      home: const SkeletonPage(),
    );
  }
}
