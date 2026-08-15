import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:mo5y/core/models/profile_model.dart';

class ProfileProvider extends ChangeNotifier {
  final Isar isar;

  ProfileProvider(this.isar) {
    _loadProfile();
  }

  ProfileModel? _profile;
  bool _isLoading = true;

  ProfileModel? get profile => _profile;
  double get getBalance => _profile?.balance ?? 0;
  DateTime? get getLastCleanUp=>_profile?.lastCleanUp;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _profile?.isLoggedIn ?? false;

  Future<void> _loadProfile() async {
    _profile = await isar.profileModels.where().findFirst();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> login({required String username, required double amount}) async {
    await isar.writeTxn(() async {
      final profile = ProfileModel()
        ..username = username
        ..balance = amount
        ..isLoggedIn = true;

      await isar.profileModels.put(profile);
      _profile = profile;
    });
    notifyListeners();
  }

  Future<void> addToBalance({
    required double amount,
    required bool isAdd,
  }) async {
    if (_profile == null) return;
    if (isAdd) {
      await isar.writeTxn(() async {
        _profile!.balance += amount;
        await isar.profileModels.put(_profile!);
      });
    } else {
      await isar.writeTxn(() async {
        _profile!.balance -= amount;
        await isar.profileModels.put(_profile!);
      });
    }
    notifyListeners();
  }

  Future<void> setNewCleanUp({required DateTime newDate}) async{
    await isar.writeTxn(() async {
        _profile!.lastCleanUp = newDate;
        await isar.profileModels.put(_profile!);
      });
  }

  Future<void> logout() async {
    if (_profile == null) return;
    await isar.writeTxn(() async {
      _profile!.isLoggedIn = false;
      await isar.profileModels.put(_profile!);
    });
    notifyListeners();
  }

}
