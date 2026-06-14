import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'nav_folder_widget.dart' show NavFolderWidget;
import 'package:flutter/material.dart';

class NavFolderModel extends FlutterFlowModel<NavFolderWidget> {
  ///  Local state fields for this page.

  int? sameFolders = 0;

  bool activeSearch = false;

  bool activeVisible = false;

  bool activeYear = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SearchText widget.
  FocusNode? searchTextFocusNode;
  TextEditingController? searchTextTextController;
  String? Function(BuildContext, String?)? searchTextTextControllerValidator;
  String? _searchTextTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter text';
    }

    if (val.length < 2) {
      return '2 characters or more ';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    searchTextTextControllerValidator = _searchTextTextControllerValidator;
  }

  @override
  void dispose() {
    searchTextFocusNode?.dispose();
    searchTextTextController?.dispose();
  }
}
