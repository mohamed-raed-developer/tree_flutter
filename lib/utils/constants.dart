import 'package:get_storage/get_storage.dart';

class Constants {
  static const baseUrl = 'https://apps.moh.gov.ps/policies_protocols/public/';
  static const loginUrl = baseUrl + '/api/auth/login';
  static const refreshUrl = baseUrl + '/api/auth/refresh';
  static const getTreeNodeUrl = baseUrl + '/api/tree-node';
  static const addNewTreeNodeUrl = baseUrl + '/api/tree-node';
  static const addDetailsNodeUrl = baseUrl + '/api/upload-tree-node-details';
  static const updateTreeNodeUrl = baseUrl + '/api/tree-node/update';
  static const deleteTreeNodeUrl = baseUrl + '/api/tree-node/destroy';
}

String? token;