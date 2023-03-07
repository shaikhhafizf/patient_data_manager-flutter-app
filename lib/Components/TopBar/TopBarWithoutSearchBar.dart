import 'package:flutter/material.dart';

class TopBarWithoutSearchBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const TopBarWithoutSearchBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}