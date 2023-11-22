import 'package:flutter/material.dart';
import 'package:open_items/global/styles/icons/open_items_icons.dart';

abstract class UIIcons {
  // Status
  static const offline = Icons.cloud_off;
  static const online = Icons.language;
  static const server = Icons.dns_outlined;
  static const account = Icons.person;
  static const login = Icons.login;
  static const ascending = Icons.arrow_upward;
  static const descending = Icons.arrow_downward;
  static const checkedBox = OpenItemsIcons.checkedBox;
  static const uncheckedBox = OpenItemsIcons.uncheckedBox;
  static const bullet = OpenItemsIcons.bullet;

  // Actions
  static const import = OpenItemsIcons.import;
  static const export = OpenItemsIcons.export;
  static const add = Icons.add;
  static const rename = OpenItemsIcons.rename;
  static const edit = Icons.edit;
  static const delete = OpenItemsIcons.delete;
  static const search = Icons.search;
  static const order = Icons.sort;

  // Input
  static const visible = Icons.visibility;
  static const hidden = Icons.visibility_off;
  static const clear = Icons.clear;

  // Navigation
  static const back = Icons.arrow_back;
  static const menu = Icons.menu;

  // List type
  static const checklist = OpenItemsIcons.checklist;
  static const numberedList = OpenItemsIcons.numberedList;
  static const bulletList = OpenItemsIcons.bulletList;
}
