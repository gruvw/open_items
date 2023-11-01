import 'package:flutter/material.dart';
import 'package:open_items/global/styles/icons/open_items_icons.dart';

abstract class UIIcons {
  // Status
  static const offline = Icons.cloud_off;
  static const online = Icons.language;
  static const server = Icons.dns_outlined;
  static const account = Icons.person;
  static const login = Icons.login;

  // Actions
  static const import = OpenItemsIcons.import;
  static const export = OpenItemsIcons.export;
  static const add = Icons.add;
  static const rename = OpenItemsIcons.rename;
  static const delete = OpenItemsIcons.delete;

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
