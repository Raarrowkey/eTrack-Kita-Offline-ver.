import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PieChartCollectionRecord extends FirestoreRecord {
  PieChartCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userForeignKEY" field.
  DocumentReference? _userForeignKEY;
  DocumentReference? get userForeignKEY => _userForeignKEY;
  bool hasUserForeignKEY() => _userForeignKEY != null;

  // "folderForeignKEY" field.
  DocumentReference? _folderForeignKEY;
  DocumentReference? get folderForeignKEY => _folderForeignKEY;
  bool hasFolderForeignKEY() => _folderForeignKEY != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "totalAmountsFolder" field.
  double? _totalAmountsFolder;
  double get totalAmountsFolder => _totalAmountsFolder ?? 0.0;
  bool hasTotalAmountsFolder() => _totalAmountsFolder != null;

  void _initializeFields() {
    _userForeignKEY = snapshotData['userForeignKEY'] as DocumentReference?;
    _folderForeignKEY = snapshotData['folderForeignKEY'] as DocumentReference?;
    _category = snapshotData['category'] as String?;
    _totalAmountsFolder =
        castToType<double>(snapshotData['totalAmountsFolder']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pieChartCollection');

  static Stream<PieChartCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PieChartCollectionRecord.fromSnapshot(s));

  static Future<PieChartCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PieChartCollectionRecord.fromSnapshot(s));

  static PieChartCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PieChartCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PieChartCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PieChartCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PieChartCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PieChartCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPieChartCollectionRecordData({
  DocumentReference? userForeignKEY,
  DocumentReference? folderForeignKEY,
  String? category,
  double? totalAmountsFolder,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userForeignKEY': userForeignKEY,
      'folderForeignKEY': folderForeignKEY,
      'category': category,
      'totalAmountsFolder': totalAmountsFolder,
    }.withoutNulls,
  );

  return firestoreData;
}

class PieChartCollectionRecordDocumentEquality
    implements Equality<PieChartCollectionRecord> {
  const PieChartCollectionRecordDocumentEquality();

  @override
  bool equals(PieChartCollectionRecord? e1, PieChartCollectionRecord? e2) {
    return e1?.userForeignKEY == e2?.userForeignKEY &&
        e1?.folderForeignKEY == e2?.folderForeignKEY &&
        e1?.category == e2?.category &&
        e1?.totalAmountsFolder == e2?.totalAmountsFolder;
  }

  @override
  int hash(PieChartCollectionRecord? e) => const ListEquality().hash([
        e?.userForeignKEY,
        e?.folderForeignKEY,
        e?.category,
        e?.totalAmountsFolder
      ]);

  @override
  bool isValidKey(Object? o) => o is PieChartCollectionRecord;
}
