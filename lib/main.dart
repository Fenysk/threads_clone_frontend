import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:threads_clone/common/bloc/button/button.state-cubit.dart';
import 'package:threads_clone/presentation/auth/pages/register.page.dart';
import 'package:threads_clone/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load();
  } catch (e) {
    print('Erreur lors du chargement du fichier .env: $e');
  }

  setupServiceLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: MaterialApp(
        home: RegisterPage(),
      ),
    );
  }
}
