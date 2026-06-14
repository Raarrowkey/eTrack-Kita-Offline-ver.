import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'farm_app_d_b',
      'farm_db.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetBudgetsRow>> getBudgets({
    int? id,
  }) =>
      performGetBudgets(
        _database,
        id: id,
      );

  Future<List<GetBudgetFolderRow>> getBudgetFolder() => performGetBudgetFolder(
        _database,
      );

  Future<List<GetNotificationsRow>> getNotifications() =>
      performGetNotifications(
        _database,
      );

  Future<List<SumRevenueRow>> sumRevenue() => performSumRevenue(
        _database,
      );

  Future<List<FilterByYearRow>> filterByYear({
    String? folderYear,
  }) =>
      performFilterByYear(
        _database,
        folderYear: folderYear,
      );

  Future<List<SumExpenseRow>> sumExpense() => performSumExpense(
        _database,
      );

  Future<List<SumNETRow>> sumNET() => performSumNET(
        _database,
      );

  Future<List<ForeignRevenueRow>> foreignRevenue({
    int? folderID,
  }) =>
      performForeignRevenue(
        _database,
        folderID: folderID,
      );

  Future<List<ForeignExpenseRow>> foreignExpense({
    int? folderID,
  }) =>
      performForeignExpense(
        _database,
        folderID: folderID,
      );

  Future<List<ForeignNETRow>> foreignNET({
    int? folderID,
  }) =>
      performForeignNET(
        _database,
        folderID: folderID,
      );

  Future<List<GetFolderDropdownRow>> getFolderDropdown({
    String? folderName,
  }) =>
      performGetFolderDropdown(
        _database,
        folderName: folderName,
      );

  Future<List<GetBudgetsFiltersRow>> getBudgetsFilters({
    int? id,
  }) =>
      performGetBudgetsFilters(
        _database,
        id: id,
      );

  Future<List<GetFolderDropYearRow>> getFolderDropYear({
    String? folderYear,
  }) =>
      performGetFolderDropYear(
        _database,
        folderYear: folderYear,
      );

  Future<List<FilterFolderRow>> filterFolder({
    String? folderYear,
  }) =>
      performFilterFolder(
        _database,
        folderYear: folderYear,
      );

  Future<List<GetDuplicateRow>> getDuplicate({
    String? folderName,
  }) =>
      performGetDuplicate(
        _database,
        folderName: folderName,
      );

  Future<List<YearlyCALCRow>> yearlyCALC({
    String? folderYear,
  }) =>
      performYearlyCALC(
        _database,
        folderYear: folderYear,
      );

  Future<List<SearchFolderRow>> searchFolder({
    String? paramName,
  }) =>
      performSearchFolder(
        _database,
        paramName: paramName,
      );

  Future<List<SearchBudgetsRow>> searchBudgets({
    int? id,
    String? paramName,
  }) =>
      performSearchBudgets(
        _database,
        id: id,
        paramName: paramName,
      );

  Future<List<GetFolderIDRow>> getFolderID({
    int? id,
  }) =>
      performGetFolderID(
        _database,
        id: id,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future addBudgetFolder({
    String? folder,
    String? folderYear,
    double? folderREV,
    double? folderEXP,
    double? folderNET,
  }) =>
      performAddBudgetFolder(
        _database,
        folder: folder,
        folderYear: folderYear,
        folderREV: folderREV,
        folderEXP: folderEXP,
        folderNET: folderNET,
      );

  Future addBudgets({
    String? title,
    String? description,
    String? categories,
    String? tags,
    String? folderYear,
    String? weatherData,
    double? amount,
    int? folderID,
    String? dateCreated,
  }) =>
      performAddBudgets(
        _database,
        title: title,
        description: description,
        categories: categories,
        tags: tags,
        folderYear: folderYear,
        weatherData: weatherData,
        amount: amount,
        folderID: folderID,
        dateCreated: dateCreated,
      );

  Future updateBudgetFolder({
    String? folder,
    String? folderYear,
    int? id,
  }) =>
      performUpdateBudgetFolder(
        _database,
        folder: folder,
        folderYear: folderYear,
        id: id,
      );

  Future updateBudgets({
    String? title,
    String? description,
    String? categories,
    String? tags,
    String? folderYear,
    String? weatherData,
    double? amount,
    int? id,
    String? dateCreated,
  }) =>
      performUpdateBudgets(
        _database,
        title: title,
        description: description,
        categories: categories,
        tags: tags,
        folderYear: folderYear,
        weatherData: weatherData,
        amount: amount,
        id: id,
        dateCreated: dateCreated,
      );

  Future deleteBudgets({
    int? id,
  }) =>
      performDeleteBudgets(
        _database,
        id: id,
      );

  Future deleteBudgetFolder({
    int? id,
  }) =>
      performDeleteBudgetFolder(
        _database,
        id: id,
      );

  Future deleteCascade({
    int? id,
  }) =>
      performDeleteCascade(
        _database,
        id: id,
      );

  Future delAllBudgets() => performDelAllBudgets(
        _database,
      );

  Future delAllFolders() => performDelAllFolders(
        _database,
      );

  Future updateBudgetCalcs({
    String? folder,
    String? folderYear,
    int? id,
    double? folderREV,
    double? folderEXP,
    double? folderNET,
  }) =>
      performUpdateBudgetCalcs(
        _database,
        folder: folder,
        folderYear: folderYear,
        id: id,
        folderREV: folderREV,
        folderEXP: folderEXP,
        folderNET: folderNET,
      );

  Future addNotifications({
    String? timeCreated,
    String? actionType,
    String? titleFolder,
    String? folderCollection,
  }) =>
      performAddNotifications(
        _database,
        timeCreated: timeCreated,
        actionType: actionType,
        titleFolder: titleFolder,
        folderCollection: folderCollection,
      );

  Future deleteNotif() => performDeleteNotif(
        _database,
      );

  /// END UPDATE QUERY CALLS
}
