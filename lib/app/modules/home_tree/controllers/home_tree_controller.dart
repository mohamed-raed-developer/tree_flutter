
import 'package:flutter/material.dart';
import 'package:getx_skeleton/app/data/document.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/widget/directory_widget.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/widget/file_widget.dart';
import 'package:tree_view/tree_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class HomeTreeController extends GetxController {
  late final serverData;


  List<Document> documentList = [
    Document(
      name: 'Desktop',
      dateModified: DateTime.now(),
      isFile: false,
      childData: [
        Document(name: 'Projects', dateModified: DateTime.now(),
            childData: [
          Document(
              name: 'flutter_app',
              dateModified: DateTime.now(),
              childData: [
                Document(
                  name: 'README.md',
                  dateModified: DateTime.now(),
                  isFile: true,
                ),
                Document(
                  name: 'pubspec.yaml',
                  dateModified: DateTime.now(),
                  isFile: true,
                ),
                Document(
                  name: 'pubspec.lock',
                  dateModified: DateTime.now(),
                  isFile: true,
                ),
                Document(
                  name: '.gitignore',
                  dateModified: DateTime.now(),
                  isFile: true,
                ),
                Document(
                  name: 'lib',
                  dateModified: DateTime.now(),
                  isFile: false,
                ),
              ])
        ]),
        Document(
          name: 'test.sh',
          dateModified: DateTime.now(),
          isFile: true,
        ),
        Document(
          name: 'image.png',
          dateModified: DateTime.now(),
          isFile: true,
        ),
        Document(
          name: 'image2.png',
          dateModified: DateTime.now(),
          isFile: true,
        ),
        Document(
          name: 'image3.png',
          dateModified: DateTime.now(),
          isFile: true,
        ),
      ],
    ),
  ];

  List<Widget> getChildList(List<Document> childDocuments) {
    return childDocuments.map((document) {
      if (!document.isFile) {
        return Container(
          margin: const EdgeInsets.only(left: 8),
          child: TreeViewChild(
            parent: _getDocumentWidget(document: document),
            children: getChildList(document.childData),
          ),
        );
      }
      return Container(
        margin: const EdgeInsets.only(left: 4.0),
        child: _getDocumentWidget(document: document),
      );
    }).toList();
  }


  Widget _getDocumentWidget({required Document document}) => document.isFile
      ? _getFileWidget(document: document)
      : _getDirectoryWidget(document: document);

  DirectoryWidget _getDirectoryWidget({required Document document}) => DirectoryWidget(
        directoryName: document.name,
        lastModified: document.dateModified,
      );

  FileWidget _getFileWidget({required Document document}) => FileWidget(
    fileName: document.name,
    lastModified: document.dateModified,
  );





  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
  }
}