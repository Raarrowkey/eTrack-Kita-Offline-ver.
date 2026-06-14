import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'transaction_f_a_b_create_widget.dart' show TransactionFABCreateWidget;
import 'package:flutter/material.dart';

class TransactionFABCreateModel
    extends FlutterFlowModel<TransactionFABCreateWidget> {
  ///  Local state fields for this page.

  double? amountValueSTATE;

  String? dropdownValueSTATE;

  bool timerEnded = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for titleTextField widget.
  FocusNode? titleTextFieldFocusNode;
  TextEditingController? titleTextFieldTextController;
  String? Function(BuildContext, String?)?
      titleTextFieldTextControllerValidator;
  // State field(s) for descriptionTextField widget.
  FocusNode? descriptionTextFieldFocusNode;
  TextEditingController? descriptionTextFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionTextFieldTextControllerValidator;
  // State field(s) for ChoiceChips-Revenue widget.
  FormFieldController<List<String>>? choiceChipsRevenueValueController;
  String? get choiceChipsRevenueValue =>
      choiceChipsRevenueValueController?.value?.firstOrNull;
  set choiceChipsRevenueValue(String? val) =>
      choiceChipsRevenueValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips-Expense widget.
  FormFieldController<List<String>>? choiceChipsExpenseValueController;
  String? get choiceChipsExpenseValue =>
      choiceChipsExpenseValueController?.value?.firstOrNull;
  set choiceChipsExpenseValue(String? val) =>
      choiceChipsExpenseValueController?.value = val != null ? [val] : [];
  // State field(s) for weatherDropDown widget.
  String? weatherDropDownValue;
  FormFieldController<String>? weatherDropDownValueController;
  // State field(s) for amountTextField widget.
  FocusNode? amountTextFieldFocusNode;
  TextEditingController? amountTextFieldTextController;
  String? Function(BuildContext, String?)?
      amountTextFieldTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleTextFieldFocusNode?.dispose();
    titleTextFieldTextController?.dispose();

    descriptionTextFieldFocusNode?.dispose();
    descriptionTextFieldTextController?.dispose();

    amountTextFieldFocusNode?.dispose();
    amountTextFieldTextController?.dispose();
  }
}
