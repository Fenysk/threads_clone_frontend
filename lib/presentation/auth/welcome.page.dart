import 'package:flutter/material.dart';
import 'package:threads_clone/presentation/auth/tabs/login.tab.dart';
import 'package:threads_clone/presentation/auth/tabs/register.tab.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/welcome-decoration.webp',
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 2 / 5,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 1 / 5),
              const Text(
                'Exprimez-vous\ndavantage avec\nThreads',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Expanded(
                        child: TabBarView(
                          children: [
                            RegisterTab(),
                            LoginTab(),
                          ],
                        ),
                      ),
                      const TabBar(
                        tabs: [
                          Tab(text: 'Register'),
                          Tab(text: 'Login'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
