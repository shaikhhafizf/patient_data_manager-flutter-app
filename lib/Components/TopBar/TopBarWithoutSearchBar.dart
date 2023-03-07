import 'package:flutter/material.dart';
import 'package:patient_data_manager/Components/Text/OptionLabel.dart';

class TopBarWithoutSearchBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<String>? dropdownItems;
  final Function(String)? onDropdownItemSelected;

  const TopBarWithoutSearchBar({
    Key? key,
    required this.title,
    this.dropdownItems,
    this.onDropdownItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        if (dropdownItems != null)
          Builder(
            builder: (BuildContext context) => PopupMenuButton<String>(
              onSelected: onDropdownItemSelected,
              itemBuilder: (BuildContext context) {
                return dropdownItems!
                    .map(
                      (item) => PopupMenuItem<String>(
                        value: item,
                        child: OptionLabel(
                          text: item,
                        ),
                      ),
                    )
                    .toList();
              },
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
