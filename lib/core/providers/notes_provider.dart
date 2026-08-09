import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:mo5y/core/models/note_model.dart';
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

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
