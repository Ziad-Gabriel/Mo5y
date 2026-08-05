import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:mo5y/core/models/note_model.dart';
import 'package:mo5y/core/models/profile_model.dart';
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

   void listenToNotes(int profileId) {
    _subscription?.cancel();
    _isLoading = true;
    notifyListeners();

    _subscription = isar.noteModels
        .filter()
        .profile((q) => q.idEqualTo(profileId))
        .watch(fireImmediately: true)
        .listen((updatedNotes) {
      _notes = updatedNotes;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> addNote({
    required NoteModel note,
    required ProfileModel profile,
    ProjectModel? project,
  }) async {
    NoteService noteService = NoteService(isar);
    await noteService.addNote(
      note: note,
      profile: profile,
      project: project,
    );
  }

  Future<void> deleteNote(int id) {
    NoteService noteService = NoteService(isar);
    return noteService.deleteNote(id: id);
  }

   @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}