import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mo5y/core/providers/notes_provider.dart';
import 'package:mo5y/core/providers/projects_provider.dart';
import 'package:mo5y/core/providers/tasks_provider.dart';
import 'package:mo5y/core/providers/transaction_provider.dart';
import 'package:provider/provider.dart';
import 'package:mo5y/core/providers/profile_provider.dart';
import 'package:mo5y/features/auth/view/auth_view.dart';
import 'package:mo5y/main_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    await context.read<TasksProvider>().dailyDeleteCompletedTasks(context);
    if(!mounted)return;
    context.read<TasksProvider>().listenToTasks();
    context.read<NotesProvider>().listenToNotes();
    context.read<ProjectsProvider>().listenToProjects();
    context.read<TransactionProvider>().listenToTransactions();
    });
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _waitForDataThenNavigate();
    });
  }

  Future<void> _waitForDataThenNavigate() async {
    final profileProvider = context.read<ProfileProvider>();

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    final nextScreen = profileProvider.isLoggedIn
        ? const MainView()
        : const AuthView();

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 1500),
        pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Image.asset(
            'assets/logo/mo5y_logo.png',
            width: 160,
            height: 160,
          ),
        ),
      ),
    );
  }
}
