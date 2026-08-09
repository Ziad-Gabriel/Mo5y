import 'package:isar/isar.dart';
import 'package:mo5y/core/models/note_model.dart';
import 'package:mo5y/core/models/project_model.dart';

class NoteService {
  final Isar isar;

  NoteService(this.isar);

  Future<void> addNote({
    required String? title,
    required String? description,
    ProjectModel? project,
    List<String>? images,
  }) async {
    final note = NoteModel();
    note.title = title;
    note.description = description;
    note.images = images;
    if (project != null) {
      note.project.value = project;
    }

    await isar.writeTxn(() async {
      await isar.noteModels.put(note);
      if (project != null) await note.project.save();
    });
  }

  Future<void> updateNote({required NoteModel note}) {
    return isar.writeTxn(() => isar.noteModels.put(note));
  }

  Future<void> deleteNote({required int id}) async {
    await isar.writeTxn(() => isar.noteModels.delete(id));
  }

  Stream<List<NoteModel>> getAllNotes() {
    return isar.noteModels.where().watch(fireImmediately: true);
  }
}
