import 'package:permission_handler/permission_handler.dart';

Future<void> askPermissions() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.camera,
    Permission.storage,
  ].request();
}