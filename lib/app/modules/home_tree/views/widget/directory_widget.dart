import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/widget/utils.dart';
import 'package:tree_view/tree_view.dart';

class DirectoryWidget extends StatelessWidget {
  final String directoryName;
  final DateTime lastModified;
  final VoidCallback addNode;
  final VoidCallback delete;

  DirectoryWidget({
    required this.directoryName,
    required this.lastModified,
    required this.delete,
    required this.addNode
  });

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Text(directoryName);
    Icon folderIcon = const Icon(Icons.folder);

    Widget lastModifiedWidget = Text(
      Utils.getFormattedDateTime(dateTime: lastModified),
    );

    return ListTile(
      leading: folderIcon,
      title: titleWidget,
      subtitle: lastModifiedWidget,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: addNode, icon: const Icon(Icons.add, color: Colors.green, size: 25,)),
          IconButton(onPressed: delete, icon: const Icon(Icons.delete, color: Colors.redAccent, size: 25,)),
        ],
      ),
      onTap: (()=> print(directoryName)),
    );
  }
}