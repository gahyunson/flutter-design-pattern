import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


abstract class PermissionTemplate {
  List<Permission> get permissions;

  Future<void> requestPermissions() async {
    await permissions.request();
  }
}