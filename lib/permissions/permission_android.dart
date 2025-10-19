import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'permission_template.dart';


class PermissionAndroid extends PermissionTemplate {
  @override
  List<Permission> get permissions => [
    Permission.camera,
    Permission.microphone,
    Permission.storage,
    Permission.photos,
    Permission.videos,
    Permission.mediaLibrary,
    Permission.manageExternalStorage,
  ];
}