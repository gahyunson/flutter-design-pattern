import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'permission_template.dart';


class PermissionIOS extends PermissionTemplate {
  @override
  List<Permission> get permissions => [
    Permission.camera,
    Permission.photos,
    Permission.videos,
  ];
}