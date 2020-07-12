import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

class PermissionsBloc {
  BehaviorSubject<PermissionStatus> _storagePermissionStatus$;

  BehaviorSubject<PermissionStatus> get storagePermissionStatus$ => _storagePermissionStatus$;

  PermissionsBloc() {
    _storagePermissionStatus$ = BehaviorSubject<PermissionStatus>();
    requestStoragePermission();
  }

  Future<void> requestStoragePermission() async {
    final Map<Permission, PermissionStatus> _permission = await [
      Permission.storage,
      Permission.camera,
      Permission.sms,
      Permission.contacts,
    ].request();
    final PermissionStatus _state = _permission.values.toList()[0];
    _storagePermissionStatus$.add(_state);
  }

  void dispose() {
    _storagePermissionStatus$.close();
  }
}
