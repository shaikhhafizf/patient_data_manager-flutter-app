import 'package:flutter/material.dart';
import 'package:patient_data_manager/Components/Text/OptionLabel.dart';

class TopBarWithoutSearchBarWithRefresh extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback onRefresh;

  const TopBarWithoutSearchBarWithRefresh(
      {Key? key, required this.title, required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: onRefresh,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
