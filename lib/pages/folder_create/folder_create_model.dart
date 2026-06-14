import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'folder_create_widget.dart' show FolderCreateWidget;
import 'package:flutter/material.dart';

class FolderCreateModel extends FlutterFlowModel<FolderCreateWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for folderNameWIDGET widget.
  FocusNode? folderNameWIDGETFocusNode;
  TextEditingController? folderNameWIDGETTextController;
  String? Function(BuildContext, String?)?
      folderNameWIDGETTextControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - SQLite (GetDuplicate)] action in Button widget.
  List<GetDuplicateRow>? duplicateFolder;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    folderNameWIDGETFocusNode?.dispose();
    folderNameWIDGETTextController?.dispose();
  }
}
