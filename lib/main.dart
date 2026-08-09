import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:isar/isar.dart';
import 'package:mo5y/core/models/note_model.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/models/task_model.dart';
import 'package:mo5y/core/models/transaction_model.dart';
import 'package:mo5y/core/providers/main_widgets_index_provider.dart';
import 'package:mo5y/core/themes/themes.dart';
import 'package:mo5y/main_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([
    ProjectModelSchema,
    TaskModelSchema,
    NoteModelSchema,
    TransactionModelSchema
  ], directory: dir.path);
  runApp(
    MultiProvider(
      providers: [
         Provider<Isar>.value(value: isar),
        ChangeNotifierProvider(create: (context) => MainWidgetsIndexProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppThemes.darkTheme,
      home: const MainView(),
    );
  }
}
