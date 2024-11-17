import 'package:flutter/material.dart';
import 'package:threads_clone/core/configs/theme/theme.config.dart';
import 'package:threads_clone/presentation/auth/tabs/login.tab.dart';
import 'package:threads_clone/presentation/auth/tabs/register.tab.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
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
                SizedBox(height: MediaQuery.of(context).size.height * 2 / 7),
                Text(
                  'Exprimez-vous\ndavantage avec\nThreads',
                  style: ThemeConfig.theme.textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
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
