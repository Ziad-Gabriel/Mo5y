import 'dart:async';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mo5y/core/controllers/note_controller.dart';
import 'package:mo5y/core/models/note_model.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/services/note_service.dart';

class NotesProvider extends ChangeNotifier {
  final Isar isar;
  NotesProvider(this.isar);

  List<NoteModel> _notes = [];
  List<NoteModel> get notes => _notes;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  StreamSubscription<List<NoteModel>>? _subscription;

  void listenToNotes() {
    _subscription?.cancel();
    _isLoading = true;
    notifyListeners();

    _subscription = NoteService(isar).getAllNotes().listen((updatedNotes) {
      _notes = updatedNotes;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<bool> addNote({
    required BuildContext context,
    required String? title,
    required String? content,
    required ProjectModel? project,
  }) async {
    return await NoteController(
      isar,
    ).addNote(title: title, content: content, project: project);
  }

  Future<bool> updateNote({
    required BuildContext context,
    required int id,
    required String? title,
    required String? content,
    required ProjectModel? project,
  }) async {
    return await NoteController(
      isar,
    ).updateNote(id: id, title: title, content: content, project: project);
  }

  Future<void> deleteNote({required int id})async{
    return NoteController(isar).deleteNote(id: id);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
