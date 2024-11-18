import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:threads_clone/3_presentation/core/services/theme_service.dart';
import 'package:threads_clone/3_presentation/core/configs/theme/theme.config.dart';
import 'package:threads_clone/3_presentation/pages/auth/bloc/auth.state-cubit.dart';
import 'package:threads_clone/3_presentation/pages/auth/bloc/auth.state.dart';
import 'package:threads_clone/3_presentation/core/configs/routes/routes.config.dart';
import 'package:threads_clone/3_presentation/pages/auth/auth.page.dart';
import 'package:threads_clone/3_presentation/pages/home/home.page.dart';
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
    ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (BuildContext context, ThemeService themeService, Widget? child) {
        return BlocProvider(
          create: (context) => AuthStateCubit()..appStarted(),
          child: MaterialApp(
            theme: themeService.isDarkModeOn ? AppThemeConfig.darkTheme : AppThemeConfig.lightTheme,
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Threads Clone'),
                actions: [
                  Switch(
                    value: Provider.of<ThemeService>(context).isDarkModeOn,
                    onChanged: (value) => Provider.of<ThemeService>(context, listen: false).toggleTheme(),
                  ),
                ],
              ),
              body: BlocBuilder<AuthStateCubit, AuthState>(
                builder: (context, state) {
                  return switch (state) {
                    AuthenticatedState() => const HomePage(),
                    UnauthenticatedState() => const AuthPage(),
                    _ => const Center(child: CircularProgressIndicator()),
                  };
                },
              ),
            ),
            onGenerateRoute: RoutesConfig.generateRoute,
          ),
        );
      },
    );
  }
}
