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



    Icon fileIcon = attachmentType == "file" ? const Icon(Icons.insert_drive_file, color: Colors.deepPurple,) : const Icon(Icons.link_rounded, color: Colors.lightGreen,);


    String _fileName ='';

    if(attachmentType == 'file'){
      _fileName = fileName.split('/').last;
    }else{
      _fileName = fileName;
    }

    return Card(
      elevation: 0.0,
      child: ListTile(
        leading: fileIcon,
        // trailing: hasDelete ? IconButton(
        //     onPressed: (){onDelete();},
        //     icon: const Icon(Icons.delete), color: Colors.redAccent) : null,
        title: Text(_fileName, style: TextStyle(color: attachmentType == "url" ? Colors.blueAccent : null),),
       // subtitle: lastModifiedWidget,
        onTap: (()=> print(_fileName)),
      ),
    );
  }
}