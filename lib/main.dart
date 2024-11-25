import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:threads_clone/3_presentation/core/configs/theme/theme.config.dart';
import 'package:threads_clone/3_presentation/core/configs/router/routes.config.dart';
import 'package:threads_clone/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load();
  } catch (e) {
    print('Erreur lors du chargement du fichier .env: $e');
  }

  setupServiceLocator();

  runApp(
    MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Threads Clone',
      localizationsDelegates: const [
        ...GlobalMaterialLocalizations.delegates,
        GlobalMaterialLocalizations.delegate,
      ],
      themeMode: ThemeMode.system,
      theme: AppThemeConfig.lightTheme,
      darkTheme: AppThemeConfig.darkTheme,
      routerConfig: RoutesConfig.routes,
    );
  }
}
