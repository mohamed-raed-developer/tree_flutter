

import 'package:flutter/material.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/widget/utils.dart';

class FileWidget extends StatelessWidget {
  final String fileName;
  final DateTime lastModified;
  final bool hasDelete;
  final Function onDelete;
  FileWidget({required this.fileName, required this.lastModified, required this.hasDelete, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    Widget fileNameWidget = Text(this.fileName);
    Widget lastModifiedWidget = Text(
      Utils.getFormattedDateTime(dateTime: lastModified),
    );
    Icon fileIcon = Icon(Icons.insert_drive_file);

    return Card(
      elevation: 0.0,
      child: ListTile(
        leading: fileIcon,
        trailing: hasDelete ? IconButton(
            onPressed: (){onDelete();},
            icon: Icon(Icons.delete), color: Colors.redAccent) : null,
        title: fileNameWidget,
        subtitle: lastModifiedWidget,
        onTap: (()=> print(fileName)),
      ),
    );
  }
}