import 'package:application/core/permission_bloc.dart';
import 'package:application/core/storage_media_block.dart';

class GlobalBloc {
  PermissionsBloc _permissionsBloc;
  StorageMediaBloc _storageMediaBloc;

  PermissionsBloc get permissionsBloc => _permissionsBloc;

  StorageMediaBloc get storageMediaBloc => _storageMediaBloc;

  GlobalBloc() {
    _permissionsBloc = PermissionsBloc();
    _storageMediaBloc = StorageMediaBloc();
  }

  void dispose() {
    _permissionsBloc.dispose();
    _storageMediaBloc.dispose();
  }
}
