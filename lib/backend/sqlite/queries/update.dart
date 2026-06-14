import 'package:sqflite/sqflite.dart';

/// BEGIN ADDBUDGETFOLDER
Future performAddBudgetFolder(
  Database database, {
  String? folder,
  String? folderYear,
  double? folderREV,
  double? folderEXP,
  double? folderNET,
}) {
  final query = '''
INSERT INTO BudgetFolder (folder, folder_Year, folderREV, folderEXP, folderNET) VALUES ('${folder}', '${folderYear}', ${folderREV}, ${folderEXP}, ${folderNET});
''';
  return database.rawQuery(query);
}

/// END ADDBUDGETFOLDER

/// BEGIN ADDBUDGETS
Future performAddBudgets(
  Database database, {
  String? title,
  String? description,
  String? categories,
  String? tags,
  String? folderYear,
  String? weatherData,
  double? amount,
  int? folderID,
  String? dateCreated,
}) {
  final query = '''
INSERT INTO Budgets (budgetFolder_ID, title, description, categories, tags, folderYear, weather_data, amount, date_created) VALUES (${folderID}, '${title}', '${description}', '${categories}', '${tags}', '${folderYear}', '${weatherData}', ${amount}, '${dateCreated}');
''';
  return database.rawQuery(query);
}

/// END ADDBUDGETS

/// BEGIN UPDATE BUDGETFOLDER
Future performUpdateBudgetFolder(
  Database database, {
  String? folder,
  String? folderYear,
  int? id,
}) {
  final query = '''
UPDATE BudgetFolder set folder = '${folder}',  folder_Year ='${folderYear}'
WHERE folder_ID = ${id};
''';
  return database.rawQuery(query);
}

/// END UPDATE BUDGETFOLDER

/// BEGIN UPDATE BUDGETS
Future performUpdateBudgets(
  Database database, {
  String? title,
  String? description,
  String? categories,
  String? tags,
  String? folderYear,
  String? weatherData,
  double? amount,
  int? id,
  String? dateCreated,
}) {
  final query = '''
UPDATE Budgets set title = '${title}',  description = '${description}', categories = '${categories}', tags = '${tags}', folderYear = '${folderYear}', weather_data = '${weatherData}', amount = ${amount}, date_created = '${dateCreated}' 
WHERE budget_ID = ${id};

''';
  return database.rawQuery(query);
}

/// END UPDATE BUDGETS

/// BEGIN DELETEBUDGETS
Future performDeleteBudgets(
  Database database, {
  int? id,
}) {
  final query = '''
Delete from Budgets WHERE budget_ID = ${id};
''';
  return database.rawQuery(query);
}

/// END DELETEBUDGETS

/// BEGIN DELETE BUDGETFOLDER
Future performDeleteBudgetFolder(
  Database database, {
  int? id,
}) {
  final query = '''
Delete from BudgetFolder WHERE folder_ID = ${id};
''';
  return database.rawQuery(query);
}

/// END DELETE BUDGETFOLDER

/// BEGIN DELETECASCADE
Future performDeleteCascade(
  Database database, {
  int? id,
}) {
  final query = '''
Delete from Budgets WHERE budgetFolder_ID = ${id};
''';
  return database.rawQuery(query);
}

/// END DELETECASCADE

/// BEGIN DELALLBUDGETS
Future performDelAllBudgets(
  Database database,
) {
  final query = '''
Delete from Budgets;
''';
  return database.rawQuery(query);
}

/// END DELALLBUDGETS

/// BEGIN DELALLFOLDERS
Future performDelAllFolders(
  Database database,
) {
  final query = '''
Delete from BudgetFolder;
''';
  return database.rawQuery(query);
}

/// END DELALLFOLDERS

/// BEGIN UPDATE BUDGETCALCS
Future performUpdateBudgetCalcs(
  Database database, {
  String? folder,
  String? folderYear,
  int? id,
  double? folderREV,
  double? folderEXP,
  double? folderNET,
}) {
  final query = '''
UPDATE BudgetFolder set folder = '${folder}',  folder_Year ='${folderYear}', folderREV = ${folderREV}, folderEXP = ${folderEXP}, folderNET = ${folderNET}
WHERE folder_ID = ${id};
''';
  return database.rawQuery(query);
}

/// END UPDATE BUDGETCALCS

/// BEGIN ADDNOTIFICATIONS
Future performAddNotifications(
  Database database, {
  String? timeCreated,
  String? actionType,
  String? titleFolder,
  String? folderCollection,
}) {
  final query = '''
INSERT INTO Notifications (current_time, action_type, title_folder, folder_foldercollection) VALUES ('${timeCreated}', '${actionType}', '${titleFolder}',  '${folderCollection}');
''';
  return database.rawQuery(query);
}

/// END ADDNOTIFICATIONS

/// BEGIN DELETENOTIF
Future performDeleteNotif(
  Database database,
) {
  final query = '''
DELETE from Notifications;
''';
  return database.rawQuery(query);
}

/// END DELETENOTIF
