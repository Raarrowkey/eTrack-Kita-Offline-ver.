import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BudgetListCollectionRecord extends FirestoreRecord {
  BudgetListCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "tags" field.
  String? _tags;
  String get tags => _tags ?? '';
  bool hasTags() => _tags != null;

  // "date_created" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "due_date" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "due_dateChart" field.
  int? _dueDateChart;
  int get dueDateChart => _dueDateChart ?? 0;
  bool hasDueDateChart() => _dueDateChart != null;

  // "userForeignKEY" field.
  DocumentReference? _userForeignKEY;
  DocumentReference? get userForeignKEY => _userForeignKEY;
  bool hasUserForeignKEY() => _userForeignKEY != null;

  // "folderForeignKEY" field.
  DocumentReference? _folderForeignKEY;
  DocumentReference? get folderForeignKEY => _folderForeignKEY;
  bool hasFolderForeignKEY() => _folderForeignKEY != null;

  // "absolute_amount" field.
  double? _absoluteAmount;
  double get absoluteAmount => _absoluteAmount ?? 0.0;
  bool hasAbsoluteAmount() => _absoluteAmount != null;

  // "date_createdChart" field.
  int? _dateCreatedChart;
  int get dateCreatedChart => _dateCreatedChart ?? 0;
  bool hasDateCreatedChart() => _dateCreatedChart != null;

  // "folderCreatedYEAR" field.
  String? _folderCreatedYEAR;
  String get folderCreatedYEAR => _folderCreatedYEAR ?? '';
  bool hasFolderCreatedYEAR() => _folderCreatedYEAR != null;

  // "weatherData" field.
  String? _weatherData;
  String get weatherData => _weatherData ?? '';
  bool hasWeatherData() => _weatherData != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _category = snapshotData['category'] as String?;
    _tags = snapshotData['tags'] as String?;
    _dateCreated = snapshotData['date_created'] as DateTime?;
    _dueDate = snapshotData['due_date'] as DateTime?;
    _dueDateChart = castToType<int>(snapshotData['due_dateChart']);
    _userForeignKEY = snapshotData['userForeignKEY'] as DocumentReference?;
    _folderForeignKEY = snapshotData['folderForeignKEY'] as DocumentReference?;
    _absoluteAmount = castToType<double>(snapshotData['absolute_amount']);
    _dateCreatedChart = castToType<int>(snapshotData['date_createdChart']);
    _folderCreatedYEAR = snapshotData['folderCreatedYEAR'] as String?;
    _weatherData = snapshotData['weatherData'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('budgetListCollection');

  static Stream<BudgetListCollectionRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => BudgetListCollectionRecord.fromSnapshot(s));

  static Future<BudgetListCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BudgetListCollectionRecord.fromSnapshot(s));

  static BudgetListCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BudgetListCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BudgetListCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BudgetListCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BudgetListCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BudgetListCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBudgetListCollectionRecordData({
  String? title,
  String? description,
  double? amount,
  String? category,
  String? tags,
  DateTime? dateCreated,
  DateTime? dueDate,
  int? dueDateChart,
  DocumentReference? userForeignKEY,
  DocumentReference? folderForeignKEY,
  double? absoluteAmount,
  int? dateCreatedChart,
  String? folderCreatedYEAR,
  String? weatherData,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'amount': amount,
      'category': category,
      'tags': tags,
      'date_created': dateCreated,
      'due_date': dueDate,
      'due_dateChart': dueDateChart,
      'userForeignKEY': userForeignKEY,
      'folderForeignKEY': folderForeignKEY,
      'absolute_amount': absoluteAmount,
      'date_createdChart': dateCreatedChart,
      'folderCreatedYEAR': folderCreatedYEAR,
      'weatherData': weatherData,
    }.withoutNulls,
  );

  return firestoreData;
}

class BudgetListCollectionRecordDocumentEquality
    implements Equality<BudgetListCollectionRecord> {
  const BudgetListCollectionRecordDocumentEquality();

  @override
  bool equals(BudgetListCollectionRecord? e1, BudgetListCollectionRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.amount == e2?.amount &&
        e1?.category == e2?.category &&
        e1?.tags == e2?.tags &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.dueDate == e2?.dueDate &&
        e1?.dueDateChart == e2?.dueDateChart &&
        e1?.userForeignKEY == e2?.userForeignKEY &&
        e1?.folderForeignKEY == e2?.folderForeignKEY &&
        e1?.absoluteAmount == e2?.absoluteAmount &&
        e1?.dateCreatedChart == e2?.dateCreatedChart &&
        e1?.folderCreatedYEAR == e2?.folderCreatedYEAR &&
        e1?.weatherData == e2?.weatherData;
  }

  @override
  int hash(BudgetListCollectionRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.amount,
        e?.category,
        e?.tags,
        e?.dateCreated,
        e?.dueDate,
        e?.dueDateChart,
        e?.userForeignKEY,
        e?.folderForeignKEY,
        e?.absoluteAmount,
        e?.dateCreatedChart,
        e?.folderCreatedYEAR,
        e?.weatherData
      ]);

  @override
  bool isValidKey(Object? o) => o is BudgetListCollectionRecord;
}
