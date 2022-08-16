import 'package:flutter/material.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/widget/utils.dart';

class FileWidget extends StatelessWidget {
  final String fileName;
  final bool hasDelete;
  final Function onClicked;
  final String attachmentType;

  FileWidget({required this.fileName, required this.hasDelete, required this.onClicked, required this.attachmentType});

  @override
  Widget build(BuildContext context) {



    Icon fileIcon = attachmentType == "file" ? const Icon(Icons.insert_drive_file, color: Colors.deepPurple,) : const Icon(Icons.link_rounded, color: Colors.lightGreen,);
    Icon downloadIcon = attachmentType == "file" ? const Icon(Icons.download_rounded,) : const Icon(Icons.open_in_new_rounded,);


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
        trailing: IconButton(
          icon: downloadIcon,
          onPressed: () => onClicked(attachmentType,),
        ),
        title: Text(_fileName, style: TextStyle(color: attachmentType == "url" ? Colors.blueAccent : null),),
       // subtitle: lastModifiedWidget,
        onTap: (()=> print(_fileName)),
      ),
    );
  }
}