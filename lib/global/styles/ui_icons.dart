import 'package:flutter/material.dart';

abstract class UIIcons {
  // Status
  static const offline = Icons.cloud_off;
  static const online = Icons.language;
  static const server = Icons.dns_outlined;
  static const account = Icons.person;
  static const login = Icons.login;
  static const import = Icons.download; // TODO
  static const export = Icons.download; // TODO
  static const add = Icons.add;
  static const rename = Icons.edit_square; // TODO
  static const delete = Icons.delete_outline_sharp; // TODO

  // Input
  static const visible = Icons.visibility;
  static const hidden = Icons.visibility_off;
  static const clear = Icons.clear;

  // Navigation
  static const back = Icons.arrow_back;

  // List type
  static const checklist = Icons.checklist;
  static const numberedList = Icons.format_list_numbered;
  static const bulletList = Icons.format_list_bulleted;
}
