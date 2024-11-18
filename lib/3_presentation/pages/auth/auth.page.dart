import 'package:flutter/material.dart';
import 'package:threads_clone/3_presentation/pages/auth/widgets/tabs/login.tab.dart';
import 'package:threads_clone/3_presentation/pages/auth/widgets/tabs/register.tab.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void switchToLoginTab() {
    _tabController.animateTo(1);
  }

  void switchToRegisterTab() {
    _tabController.animateTo(0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: true,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/welcome-decoration.webp',
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 3 / 7,
              fit: BoxFit.cover,
              alignment: const Alignment(-0.4, 0),
            ),
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 2 / 9),
                Text(
                  'Exprimez-vous\ndavantage avec\nThreads',
                  style: themeData.textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              RegisterTab(onGoToLoginTab: switchToLoginTab),
                              LoginTab(onGoToRegisterTab: switchToRegisterTab),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
