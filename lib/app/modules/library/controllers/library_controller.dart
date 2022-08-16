import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;


class LibraryController extends GetxController {

  late String directory;
  List<String> files = [];

  void _listOfFiles() async {
    directory = (await getExternalStorageDirectory())!.path;
    Logger().w(directory);
    files = io.Directory(directory).listSync().map((e) => e.path).toList();
    Logger().w(files);
    update();
  }

  @override
  void onInit() {
    _listOfFiles();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
