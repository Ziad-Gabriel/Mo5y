import 'package:isar/isar.dart';
import 'package:mo5y/core/models/note_model.dart';
import 'package:mo5y/core/models/profile_model.dart';
import 'package:mo5y/core/models/project_model.dart';

class NoteService {
  final Isar isar;

  NoteService(this.isar);

  Future<void> addNote({
    required NoteModel note,
    required ProfileModel profile,
    ProjectModel? project,
  }) async {
    note.profile.value = profile;
    if (project != null) note.project.value = project;

    await isar.writeTxn(() async {
      await isar.noteModels.put(note);
      await note.profile.save();
      if (project != null) await note.project.save();
    });
  }

  Future<void> updateNote({required NoteModel note}) {
    return isar.writeTxn(() => isar.noteModels.put(note));
  }

  Future<void> deleteNote({required int id}) async {
    await isar.writeTxn(() => isar.noteModels.delete(id));
  }

  Stream<List<NoteModel>> getAllNotes({required int profileId}) {
    return isar.noteModels
        .filter()
        .profile((q) => q.idEqualTo(profileId))
        .watch(fireImmediately: true);
  }
}
