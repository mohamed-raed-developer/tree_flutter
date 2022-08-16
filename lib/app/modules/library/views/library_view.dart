import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_snackbar.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/library_controller.dart';

class LibraryView extends GetView<LibraryController> {
  @override
  Widget build(BuildContext context) {
    Get.put(LibraryController());
    return SafeArea(
      child: GetBuilder<LibraryController>(
        builder: (ctrl) {
          if(ctrl.files.isEmpty){
            return const Center(child: CupertinoActivityIndicator(),);
          }
          return ListView.builder(
              itemCount: ctrl.files.length,
              itemBuilder: (BuildContext context, int index) {
                return ListItem(path: ctrl.files[index]);
              });
        }
      ),
    );
  }
}

Future<void> _launchFile(String path) async {
  OpenFile.open(path);
}

class ListItem extends StatelessWidget {
  final String path;
  const ListItem({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final title = path.split('/');

    return ListTile(
        onTap: (){
          _launchFile(path);
        },
        leading: const Icon(Icons.insert_drive_file_sharp),
        title: Text(title.last, style: const TextStyle(fontSize: 14),));
  }
}
