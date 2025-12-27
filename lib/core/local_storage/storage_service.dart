import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/data/models/auth_session.dart';
import '../../objectbox.g.dart'; // Created by `flutter pub run build_runner build`

part 'storage_service.g.dart';

@Riverpod(keepAlive: true)
StorageService storageService(Ref ref) {
  throw UnimplementedError('StorageService must be initialized in main.dart');
}

class StorageService extends ChangeNotifier {
  late final Store _store;
  late final Box<AuthSession> _box;

  Future<void> init() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final storePath = p.join(docsDir.path, "obx-data");
    _store = await openStore(directory: storePath);
    _box = _store.box<AuthSession>();
  }

  Future<void> saveToken(String accessToken, {String? refreshToken}) async {
    final sessions = _box.getAll();

    // Safety check: If multiple sessions exist due to past bugs, keep only the first one
    if (sessions.length > 1) {
      final idsToRemove = sessions.sublist(1).map((s) => s.id).toList();
      _box.removeMany(idsToRemove);
    }

    final session = sessions.isNotEmpty ? sessions.first : AuthSession();

    session.accessToken = accessToken;
    if (refreshToken != null) {
      session.refreshToken = refreshToken;
    }
    _box.put(session);
    notifyListeners();
  }

  String? getToken() {
    final sessions = _box.getAll();
    return sessions.isNotEmpty ? sessions.first.accessToken : null;
  }

  String? getRefreshToken() {
    final sessions = _box.getAll();
    return sessions.isNotEmpty ? sessions.first.refreshToken : null;
  }

  Future<void> clearSession() async {
    _box.removeAll();
    notifyListeners();
  }
}
