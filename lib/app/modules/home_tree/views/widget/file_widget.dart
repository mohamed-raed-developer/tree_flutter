import 'package:flutter/material.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/widget/utils.dart';

class FileWidget extends StatelessWidget {
  final String fileName;
  final bool hasDelete;
  final Function onDelete;
  final String attachmentType;

  FileWidget({required this.fileName, required this.hasDelete, required this.onDelete, required this.attachmentType});

  @override
  Widget build(BuildContext context) {
    Widget fileNameWidget = Text(fileName);

    // Widget lastModifiedWidget = Text(
    //   Utils.getFormattedDateTime(dateTime: lastModified),
    // );

    Icon fileIcon = attachmentType == "file" ? const Icon(Icons.insert_drive_file, color: Colors.blueAccent,) : const Icon(Icons.link_rounded, color: Colors.lightGreen,);

    return Card(
      elevation: 0.0,
      child: ListTile(
        leading: fileIcon,
        // trailing: hasDelete ? IconButton(
        //     onPressed: (){onDelete();},
        //     icon: const Icon(Icons.delete), color: Colors.redAccent) : null,
        title: fileNameWidget,
       // subtitle: lastModifiedWidget,
        onTap: (()=> print(fileName)),
      ),
    );
  }
}