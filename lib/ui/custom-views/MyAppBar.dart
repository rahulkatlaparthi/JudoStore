import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String? title;

  const MyAppBar({Key? key, this.actions, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(title ?? ''),
      actions: actions == null ? [] : actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
