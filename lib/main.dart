import 'package:flutter/material.dart';
import 'package:mo5y/core/models/profile_model.dart';
import 'package:mo5y/core/providers/notes_provider.dart';
import 'package:mo5y/core/providers/profile_provider.dart';
import 'package:mo5y/core/providers/projects_provider.dart';
import 'package:mo5y/core/providers/tasks_provider.dart';
import 'package:mo5y/core/providers/transaction_provider.dart';
import 'package:mo5y/features/splash_screen/splash_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:isar/isar.dart';
import 'package:mo5y/core/models/note_model.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/models/task_model.dart';
import 'package:mo5y/core/models/transaction_model.dart';
import 'package:mo5y/core/providers/main_widgets_index_provider.dart';
import 'package:mo5y/core/themes/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([
    ProfileModelSchema,
    ProjectModelSchema,
    TaskModelSchema,
    NoteModelSchema,
    TransactionModelSchema,
  ], directory: dir.path);
  runApp(
    MultiProvider(
      providers: [
        Provider<Isar>.value(value: isar),
        ChangeNotifierProvider(create: (context) => MainWidgetsIndexProvider()),
        ChangeNotifierProvider(create: (context) => TasksProvider(isar)),
        ChangeNotifierProvider(create: (context) => NotesProvider(isar)),
        ChangeNotifierProvider(create: (context) => ProfileProvider(isar)),
        ChangeNotifierProvider(create: (context) => ProjectsProvider(isar)),
        ChangeNotifierProvider(create: (context) => TransactionProvider(isar)),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<TasksProvider>().dailyDeleteCompletedTasks(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppThemes.darkTheme,
      home: const SplashScreen(),
    );
  }
}
