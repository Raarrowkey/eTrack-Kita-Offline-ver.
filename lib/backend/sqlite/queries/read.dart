import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETBUDGETS
Future<List<GetBudgetsRow>> performGetBudgets(
  Database database, {
  int? id,
}) {
  final query = '''
SELECT * FROM Budgets WHERE budgetFolder_ID = ${id};
''';
  return _readQuery(database, query, (d) => GetBudgetsRow(d));
}

class GetBudgetsRow extends SqliteRow {
  GetBudgetsRow(Map<String, dynamic> data) : super(data);

  int get budgetID => data['budget_ID'] as int;
  int get budgetFolderID => data['budgetFolder_ID'] as int;
  String get title => data['title'] as String;
  String get description => data['description'] as String;
  String get categories => data['categories'] as String;
  String get tags => data['tags'] as String;
  String get folderYear => data['folderYear'] as String;
  String get weatherData => data['weather_data'] as String;
  double get amount => data['amount'] as double;
  String get dateCreated => data['date_created'] as String;
}

/// END GETBUDGETS

/// BEGIN GETBUDGETFOLDER
Future<List<GetBudgetFolderRow>> performGetBudgetFolder(
  Database database,
) {
  final query = '''
SELECT * FROM BudgetFolder;
''';
  return _readQuery(database, query, (d) => GetBudgetFolderRow(d));
}

class GetBudgetFolderRow extends SqliteRow {
  GetBudgetFolderRow(Map<String, dynamic> data) : super(data);

  int get folderID => data['folder_ID'] as int;
  String get folder => data['folder'] as String;
  String get folderYear => data['folder_Year'] as String;
}

/// END GETBUDGETFOLDER

/// BEGIN GETNOTIFICATIONS
Future<List<GetNotificationsRow>> performGetNotifications(
  Database database,
) {
  final query = '''
SELECT * FROM Notifications;
''';
  return _readQuery(database, query, (d) => GetNotificationsRow(d));
}

class GetNotificationsRow extends SqliteRow {
  GetNotificationsRow(Map<String, dynamic> data) : super(data);

  int get notifyID => data['notify_ID'] as int;
  String get currentTime => data['current_time'] as String;
  String get actionType => data['action_type'] as String;
  String get titleFolder => data['title_folder'] as String;
  String get folderFoldercollection =>
      data['folder_foldercollection'] as String;
}

/// END GETNOTIFICATIONS

/// BEGIN SUMREVENUE
Future<List<SumRevenueRow>> performSumRevenue(
  Database database,
) {
  final query = '''
SELECT * FROM Budgets WHERE categories = 'Revenue';
''';
  return _readQuery(database, query, (d) => SumRevenueRow(d));
}

class SumRevenueRow extends SqliteRow {
  SumRevenueRow(Map<String, dynamic> data) : super(data);

  int get budgetID => data['budget_ID'] as int;
  int get budgetFolderID => data['budgetFolder_ID'] as int;
  String get title => data['title'] as String;
  String get description => data['description'] as String;
  String get categories => data['categories'] as String;
  String get tags => data['tags'] as String;
  String get folderYear => data['folderYear'] as String;
  String get weatherData => data['weather_data'] as String;
  double get amount => data['amount'] as double;
  String get dateCreated => data['date_created'] as String;
}

/// END SUMREVENUE

/// BEGIN FILTERBYYEAR
Future<List<FilterByYearRow>> performFilterByYear(
  Database database, {
  String? folderYear,
}) {
  final query = '''
SELECT * FROM Budgets WHERE folderYear = '${folderYear}';
''';
  return _readQuery(database, query, (d) => FilterByYearRow(d));
}

class FilterByYearRow extends SqliteRow {
  FilterByYearRow(Map<String, dynamic> data) : super(data);

  int get budgetID => data['budget_ID'] as int;
  int get budgetFolderID => data['budgetFolder_ID'] as int;
  String get title => data['title'] as String;
  String get description => data['description'] as String;
  String get categories => data['categories'] as String;
  String get tags => data['tags'] as String;
  String get folderYear => data['folderYear'] as String;
  String get weatherData => data['weather_data'] as String;
  double get amount => data['amount'] as double;
  DateTime get dateCreated => data['date_created'] as DateTime;
}

/// END FILTERBYYEAR

/// BEGIN SUMEXPENSE
Future<List<SumExpenseRow>> performSumExpense(
  Database database,
) {
  final query = '''
SELECT * FROM Budgets WHERE categories = 'Expense';
''';
  return _readQuery(database, query, (d) => SumExpenseRow(d));
}

class SumExpenseRow extends SqliteRow {
  SumExpenseRow(Map<String, dynamic> data) : super(data);

  int get budgetID => data['budget_ID'] as int;
  int get budgetFolderID => data['budgetFolder_ID'] as int;
  String get title => data['title'] as String;
  String get description => data['description'] as String;
  String get categories => data['categories'] as String;
  String get tags => data['tags'] as String;
  String get folderYear => data['folderYear'] as String;
  String get weatherData => data['weather_data'] as String;
  double get amount => data['amount'] as double;
  String get dateCreated => data['date_created'] as String;
}

/// END SUMEXPENSE

/// BEGIN SUMNET
Future<List<SumNETRow>> performSumNET(
  Database database,
) {
  final query = '''
SELECT * FROM Budgets;
''';
  return _readQuery(database, query, (d) => SumNETRow(d));
}

class SumNETRow extends SqliteRow {
  SumNETRow(Map<String, dynamic> data) : super(data);

  int get budgetID => data['budget_ID'] as int;
  int get budgetFolderID => data['budgetFolder_ID'] as int;
  String get title => data['title'] as String;
  String get description => data['description'] as String;
  String get categories => data['categories'] as String;
  String get tags => data['tags'] as String;
  String get folderYear => data['folderYear'] as String;
  String get weatherData => data['weather_data'] as String;
  double get amount => data['amount'] as double;
  String get dateCreated => data['date_created'] as String;
}

/// END SUMNET

/// BEGIN FOREIGNREVENUE
Future<List<ForeignRevenueRow>> performForeignRevenue(
  Database database, {
  int? folderID,
}) {
  final query = '''
SELECT * FROM Budgets WHERE categories = 'Revenue' AND budgetFolder_ID = ${folderID};
''';
  return _readQuery(database, query, (d) => ForeignRevenueRow(d));
}

class ForeignRevenueRow extends SqliteRow {
  ForeignRevenueRow(Map<String, dynamic> data) : super(data);

  int get budgetID => data['budget_ID'] as int;
  int get budgetFolderID => data['budgetFolder_ID'] as int;
  String get title => data['title'] as String;
  String get description => data['description'] as String;
  String get categories => data['categories'] as String;
  String get tags => data['tags'] as String;
  String get folderYear => data['folderYear'] as String;
  String get weatherData => data['weather_data'] as String;
  double get amount => data['amount'] as double;
  String get dateCreated => data['date_created'] as String;
}

/// END FOREIGNREVENUE

/// BEGIN FOREIGNEXPENSE
Future<List<ForeignExpenseRow>> performForeignExpense(
  Database database, {
  int? folderID,
}) {
  final query = '''
SELECT * FROM Budgets WHERE categories = 'Expense' AND budgetFolder_ID = ${folderID};
''';
  return _readQuery(database, query, (d) => ForeignExpenseRow(d));
}

class ForeignExpenseRow extends SqliteRow {
  ForeignExpenseRow(Map<String, dynamic> data) : super(data);

  int get budgetID => data['budget_ID'] as int;
  int get budgetFolderID => data['budgetFolder_ID'] as int;
  String get title => data['title'] as String;
  String get description => data['description'] as String;
  String get categories => data['categories'] as String;
  String get tags => data['tags'] as String;
  String get folderYear => data['folderYear'] as String;
  String get weatherData => data['weather_data'] as String;
  double get amount => data['amount'] as double;
  String get dateCreated => data['date_created'] as String;
}

/// END FOREIGNEXPENSE

/// BEGIN FOREIGNNET
Future<List<ForeignNETRow>> performForeignNET(
  Database database, {
  int? folderID,
}) {
  final query = '''
SELECT * FROM Budgets WHERE budgetFolder_ID = ${folderID};
''';
  return _readQuery(database, query, (d) => ForeignNETRow(d));
}

class ForeignNETRow extends SqliteRow {
  ForeignNETRow(Map<String, dynamic> data) : super(data);

  int get budgetID => data['budget_ID'] as int;
  int get budgetFolderID => data['budgetFolder_ID'] as int;
  String get title => data['title'] as String;
  String get description => data['description'] as String;
  String get categories => data['categories'] as String;
  String get tags => data['tags'] as String;
  String get folderYear => data['folderYear'] as String;
  String get weatherData => data['weather_data'] as String;
  double get amount => data['amount'] as double;
  String get dateCreated => data['date_created'] as String;
}

/// END FOREIGNNET

/// BEGIN GETFOLDERDROPDOWN
Future<List<GetFolderDropdownRow>> performGetFolderDropdown(
  Database database, {
  String? folderName,
}) {
  final query = '''
SELECT * FROM BudgetFolder WHERE folder = '${folderName}';
''';
  return _readQuery(database, query, (d) => GetFolderDropdownRow(d));
}

class GetFolderDropdownRow extends SqliteRow {
  GetFolderDropdownRow(Map<String, dynamic> data) : super(data);

  int get folderID => data['folder_ID'] as int;
  String get folder => data['folder'] as String;
  String get folderYear => data['folder_Year'] as String;
  double get folderREV => data['folderREV'] as double;
  double get folderEXP => data['folderEXP'] as double;
  double get folderNET => data['folderNET'] as double;
}

/// END GETFOLDERDROPDOWN

/// BEGIN GETBUDGETSFILTERS
Future<List<GetBudgetsFiltersRow>> performGetBudgetsFilters(
  Database database, {
  int? id,
}) {
  final query = '''
SELECT * FROM Budgets WHERE (budgetFolder_ID IS NULL OR budgetFolder_ID = ${id});

''';
  return _readQuery(database, query, (d) => GetBudgetsFiltersRow(d));
}

class GetBudgetsFiltersRow extends SqliteRow {
  GetBudgetsFiltersRow(Map<String, dynamic> data) : super(data);

  int get budgetID => data['budget_ID'] as int;
  int get budgetFolderID => data['budgetFolder_ID'] as int;
  String get title => data['title'] as String;
  String get description => data['description'] as String;
  String get categories => data['categories'] as String;
  String get tags => data['tags'] as String;
  String get folderYear => data['folderYear'] as String;
  String get weatherData => data['weather_data'] as String;
  double get amount => data['amount'] as double;
  String get dateCreated => data['date_created'] as String;
}

/// END GETBUDGETSFILTERS

/// BEGIN GETFOLDERDROPYEAR
Future<List<GetFolderDropYearRow>> performGetFolderDropYear(
  Database database, {
  String? folderYear,
}) {
  final query = '''
SELECT * FROM BudgetFolder WHERE folder_Year = '${folderYear}';
''';
  return _readQuery(database, query, (d) => GetFolderDropYearRow(d));
}

class GetFolderDropYearRow extends SqliteRow {
  GetFolderDropYearRow(Map<String, dynamic> data) : super(data);

  int get folderID => data['folder_ID'] as int;
  String get folder => data['folder'] as String;
  String get folderYear => data['folder_Year'] as String;
  double get folderREV => data['folderREV'] as double;
  double get folderEXP => data['folderEXP'] as double;
  double get folderNET => data['folderNET'] as double;
}

/// END GETFOLDERDROPYEAR

/// BEGIN FILTERFOLDER
Future<List<FilterFolderRow>> performFilterFolder(
  Database database, {
  String? folderYear,
}) {
  final query = '''
SELECT * FROM BudgetFolder WHERE (folder_Year IS NULL OR folder_Year = '' OR folder_Year = '${folderYear}');

''';
  return _readQuery(database, query, (d) => FilterFolderRow(d));
}

class FilterFolderRow extends SqliteRow {
  FilterFolderRow(Map<String, dynamic> data) : super(data);

  int get folderID => data['folder_ID'] as int;
  String get folderName => data['folderName'] as String;
  String get folderYear => data['folder_Year'] as String;
  double get folderREV => data['folderREV'] as double;
  double get folderEXP => data['folderEXP'] as double;
  double get folderNET => data['folderNET'] as double;
}

/// END FILTERFOLDER

/// BEGIN GETDUPLICATE
Future<List<GetDuplicateRow>> performGetDuplicate(
  Database database, {
  String? folderName,
}) {
  final query = '''
SELECT * FROM BudgetFolder WHERE folder = '${folderName}';
''';
  return _readQuery(database, query, (d) => GetDuplicateRow(d));
}

class GetDuplicateRow extends SqliteRow {
  GetDuplicateRow(Map<String, dynamic> data) : super(data);

  String get folder => data['folder'] as String;
}

/// END GETDUPLICATE

/// BEGIN YEARLYCALC
Future<List<YearlyCALCRow>> performYearlyCALC(
  Database database, {
  String? folderYear,
}) {
  final query = '''
SELECT * FROM BudgetFolder WHERE folder_Year = '${folderYear}';
''';
  return _readQuery(database, query, (d) => YearlyCALCRow(d));
}

class YearlyCALCRow extends SqliteRow {
  YearlyCALCRow(Map<String, dynamic> data) : super(data);

  int get folderID => data['folder_ID'] as int;
  String get folder => data['folder'] as String;
  String get folderYear => data['folder_Year'] as String;
  double get folderREV => data['folderREV'] as double;
  double get folderEXP => data['folderEXP'] as double;
  double get folderNET => data['folderNET'] as double;
}

/// END YEARLYCALC

/// BEGIN SEARCHFOLDER
Future<List<SearchFolderRow>> performSearchFolder(
  Database database, {
  String? paramName,
}) {
  final query = '''
SELECT * FROM BudgetFolder WHERE folder LIKE '%${paramName}%'
''';
  return _readQuery(database, query, (d) => SearchFolderRow(d));
}

class SearchFolderRow extends SqliteRow {
  SearchFolderRow(Map<String, dynamic> data) : super(data);

  int get folderID => data['folder_ID'] as int;
  String get folder => data['folder'] as String;
  String get folderYear => data['folder_Year'] as String;
}

/// END SEARCHFOLDER

/// BEGIN SEARCHBUDGETS
Future<List<SearchBudgetsRow>> performSearchBudgets(
  Database database, {
  int? id,
  String? paramName,
}) {
  final query = '''
SELECT * FROM Budgets WHERE budgetFolder_ID = ${id} AND title LIKE '%${paramName}%'
''';
  return _readQuery(database, query, (d) => SearchBudgetsRow(d));
}

class SearchBudgetsRow extends SqliteRow {
  SearchBudgetsRow(Map<String, dynamic> data) : super(data);

  int get budgetID => data['budget_ID'] as int;
  int get budgetFolderID => data['budgetFolder_ID'] as int;
  String get title => data['title'] as String;
  String get description => data['description'] as String;
  String get categories => data['categories'] as String;
  String get tags => data['tags'] as String;
  String get folderYear => data['folderYear'] as String;
  String get weatherData => data['weather_data'] as String;
  double get amount => data['amount'] as double;
  String get dateCreated => data['date_created'] as String;
}

/// END SEARCHBUDGETS

/// BEGIN GETFOLDERID
Future<List<GetFolderIDRow>> performGetFolderID(
  Database database, {
  int? id,
}) {
  final query = '''
SELECT * FROM BudgetFolder WHERE folder_ID = ${id};
''';
  return _readQuery(database, query, (d) => GetFolderIDRow(d));
}

class GetFolderIDRow extends SqliteRow {
  GetFolderIDRow(Map<String, dynamic> data) : super(data);

  int get folderID => data['folder_ID'] as int;
  String get folder => data['folder'] as String;
  String get folderYear => data['folder_Year'] as String;
}

/// END GETFOLDERID
