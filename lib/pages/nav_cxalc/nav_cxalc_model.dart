import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'nav_cxalc_widget.dart' show NavCxalcWidget;
import 'package:flutter/material.dart';

class NavCxalcModel extends FlutterFlowModel<NavCxalcWidget> {
  ///  Local state fields for this page.

  bool activeSearch = false;

  bool activeVisible = false;

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

  // State field(s) for revTextField widget.
  FocusNode? revTextFieldFocusNode;
  TextEditingController? revTextFieldTextController;
  String? Function(BuildContext, String?)? revTextFieldTextControllerValidator;
  // State field(s) for expenseTextField widget.
  FocusNode? expenseTextFieldFocusNode;
  TextEditingController? expenseTextFieldTextController;
  String? Function(BuildContext, String?)?
      expenseTextFieldTextControllerValidator;
  // State field(s) for netTextField widget.
  FocusNode? netTextFieldFocusNode;
  TextEditingController? netTextFieldTextController;
  String? Function(BuildContext, String?)? netTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    searchTextTextControllerValidator = _searchTextTextControllerValidator;
  }

  @override
  void dispose() {
    searchTextFocusNode?.dispose();
    searchTextTextController?.dispose();

    revTextFieldFocusNode?.dispose();
    revTextFieldTextController?.dispose();

    expenseTextFieldFocusNode?.dispose();
    expenseTextFieldTextController?.dispose();

    netTextFieldFocusNode?.dispose();
    netTextFieldTextController?.dispose();
  }
}
