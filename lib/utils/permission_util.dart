import 'package:permission_handler/permission_handler.dart';

Future<void> askPermissions() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.camera,
    Permission.storage,
  ].request();
}

Future<bool> checkAndAskCameraPermission() async {
  Permission cameraPermission = Permission.camera;

  PermissionStatus cameraPermissionStatus = await cameraPermission.status;
  if (cameraPermissionStatus.isDenied) {
    cameraPermissionStatus = await Permission.camera.request();
    if (cameraPermissionStatus.isPermanentlyDenied) {
      await openAppSettings();  
    }
  } else if (cameraPermissionStatus.isPermanentlyDenied){
    await openAppSettings();
  }

  cameraPermissionStatus = await Permission.camera.status;
  return cameraPermissionStatus.isGranted;
}