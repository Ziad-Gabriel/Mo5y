import 'package:isar/isar.dart';
import 'package:mo5y/core/models/note_model.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/services/note_service.dart';

class NoteController {
  final Isar isar;
  NoteController(this.isar);
  
  Future<bool> addNote({
    required String? title,
    required String? content,
    required ProjectModel? project,
  }) async {

    if ((title == null || title.isEmpty)&& (content == null || content.isEmpty)) {
      return false;
    }
    final note= NoteModel()
    ..title=title..content=content;


    await NoteService(isar).addNote(
      note: note,
      project: project,
    );
    return true;
  }

  Future<bool> updateNote({
    required int id,
    required String? title,
    required String? content,
    required ProjectModel? project
  }) async {
    if (title == null && content == null){
      return false;
    }
    final note = NoteModel()..title=title??''..content=content??'';
    await NoteService(isar).updateNote(note: note,project: project);
    return true;
  }

  void deleteNote({
    required int id,
  }) async {
    await NoteService(isar).deleteNote(id: id);
  }
}
