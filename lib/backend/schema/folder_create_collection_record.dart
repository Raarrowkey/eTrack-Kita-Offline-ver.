import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FolderCreateCollectionRecord extends FirestoreRecord {
  FolderCreateCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userForeignKEY" field.
  DocumentReference? _userForeignKEY;
  DocumentReference? get userForeignKEY => _userForeignKEY;
  bool hasUserForeignKEY() => _userForeignKEY != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "folder" field.
  String? _folder;
  String get folder => _folder ?? '';
  bool hasFolder() => _folder != null;

  // "revenueTotal" field.
  double? _revenueTotal;
  double get revenueTotal => _revenueTotal ?? 0.0;
  bool hasRevenueTotal() => _revenueTotal != null;

  // "expenseTotal" field.
  double? _expenseTotal;
  double get expenseTotal => _expenseTotal ?? 0.0;
  bool hasExpenseTotal() => _expenseTotal != null;

  // "NetTotal" field.
  double? _netTotal;
  double get netTotal => _netTotal ?? 0.0;
  bool hasNetTotal() => _netTotal != null;

  // "yearCreated" field.
  String? _yearCreated;
  String get yearCreated => _yearCreated ?? '';
  bool hasYearCreated() => _yearCreated != null;

  void _initializeFields() {
    _userForeignKEY = snapshotData['userForeignKEY'] as DocumentReference?;
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
    _folder = snapshotData['folder'] as String?;
    _revenueTotal = castToType<double>(snapshotData['revenueTotal']);
    _expenseTotal = castToType<double>(snapshotData['expenseTotal']);
    _netTotal = castToType<double>(snapshotData['NetTotal']);
    _yearCreated = snapshotData['yearCreated'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('folderCreateCollection');

  static Stream<FolderCreateCollectionRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => FolderCreateCollectionRecord.fromSnapshot(s));

  static Future<FolderCreateCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FolderCreateCollectionRecord.fromSnapshot(s));

  static FolderCreateCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FolderCreateCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FolderCreateCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FolderCreateCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FolderCreateCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FolderCreateCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFolderCreateCollectionRecordData({
  DocumentReference? userForeignKEY,
  DateTime? dateCreated,
  String? folder,
  double? revenueTotal,
  double? expenseTotal,
  double? netTotal,
  String? yearCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userForeignKEY': userForeignKEY,
      'dateCreated': dateCreated,
      'folder': folder,
      'revenueTotal': revenueTotal,
      'expenseTotal': expenseTotal,
      'NetTotal': netTotal,
      'yearCreated': yearCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class FolderCreateCollectionRecordDocumentEquality
    implements Equality<FolderCreateCollectionRecord> {
  const FolderCreateCollectionRecordDocumentEquality();

  @override
  bool equals(
      FolderCreateCollectionRecord? e1, FolderCreateCollectionRecord? e2) {
    return e1?.userForeignKEY == e2?.userForeignKEY &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.folder == e2?.folder &&
        e1?.revenueTotal == e2?.revenueTotal &&
        e1?.expenseTotal == e2?.expenseTotal &&
        e1?.netTotal == e2?.netTotal &&
        e1?.yearCreated == e2?.yearCreated;
  }

  @override
  int hash(FolderCreateCollectionRecord? e) => const ListEquality().hash([
        e?.userForeignKEY,
        e?.dateCreated,
        e?.folder,
        e?.revenueTotal,
        e?.expenseTotal,
        e?.netTotal,
        e?.yearCreated
      ]);

  @override
  bool isValidKey(Object? o) => o is FolderCreateCollectionRecord;
}
