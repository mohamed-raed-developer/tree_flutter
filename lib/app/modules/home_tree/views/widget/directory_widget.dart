import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/widget/utils.dart';
import 'package:tree_view/tree_view.dart';

class DirectoryWidget extends StatelessWidget {
  final String directoryName;
  final Function addNode;

  DirectoryWidget(
      {required this.directoryName,
      required this.addNode});

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Text(directoryName);
    Icon folderIcon = const Icon(Icons.folder);

    // Widget lastModifiedWidget = Text(
    //   Utils.getFormattedDateTime(dateTime: lastModified),
    // );

    PopupMenuItem _buildPopupMenuItem(String title, String value) {
      return PopupMenuItem(
        value: value,
        child: Text(title),
      );
    }

    return ListTile(
      leading: folderIcon,
      title: titleWidget,
      // subtitle: lastModifiedWidget,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PopupMenuButton(
            onSelected: (value)=> addNode(value),
            itemBuilder: (ctx) => [
              _buildPopupMenuItem('Add folder', 'folder'),
              _buildPopupMenuItem('Add files', 'files'),
              _buildPopupMenuItem('Add URLs', "url"),
              _buildPopupMenuItem('Edit', "edit"),
              _buildPopupMenuItem('Delete', "delete"),
            ],
          ),

        ],
      ),
      onTap: (() => print(directoryName)),
    );
  }
}
