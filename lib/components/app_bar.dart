import 'package:flutter/material.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }

  GeneralAppBar({this.title = 'App Bar'});

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
