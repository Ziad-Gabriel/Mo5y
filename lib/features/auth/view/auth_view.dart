import 'package:flutter/material.dart';
import 'package:mo5y/features/auth/widgets/auth_content.dart';
import 'package:mo5y/features/shared/main_container/main_container.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 170),
              Text(
                'Welcome, Enter your name and balance to start',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              MainContainer(
                duration: 0,
                curve: Curves.linear,
                height: 270,
                width: double.infinity,
                vPadding: 12,
                hPadding: 12,
                color: Theme.of(context).colorScheme.shadow,
                child: AuthContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
