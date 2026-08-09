import 'package:isar/isar.dart';
import 'package:mo5y/core/models/note_model.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/services/note_service.dart';

class NoteController {
  final Isar isar;
  NoteController(this.isar);
  
  void addNote({
    required String title,
    required String? note,
    required ProjectModel? project,
    required List<String>? images,
  }) async {
    await NoteService(isar).addNote(
      title: title,
      description: note,
      project: project,
      images: images,
    );
  }

  void updateNote({
    required NoteModel note,
  }) async {
    await NoteService(isar).updateNote(note: note);
  }

  void deleteNote({
    required int id,
  }) async {
    await NoteService(isar).deleteNote(id: id);
  }
}
