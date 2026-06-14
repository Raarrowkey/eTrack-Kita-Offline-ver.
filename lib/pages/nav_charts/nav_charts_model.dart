import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'nav_charts_widget.dart' show NavChartsWidget;
import 'package:flutter/material.dart';

class NavChartsModel extends FlutterFlowModel<NavChartsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Backend Call - SQLite (GetFolderDropdown)] action in DropDown widget.
  List<GetFolderDropdownRow>? dropdownActionFolder;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
