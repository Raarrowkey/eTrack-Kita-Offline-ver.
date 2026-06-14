import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotifyActionCollectionRecord extends FirestoreRecord {
  NotifyActionCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userForeignKEY" field.
  DocumentReference? _userForeignKEY;
  DocumentReference? get userForeignKEY => _userForeignKEY;
  bool hasUserForeignKEY() => _userForeignKEY != null;

  // "action_type" field.
  String? _actionType;
  String get actionType => _actionType ?? '';
  bool hasActionType() => _actionType != null;

  // "title_and_folder" field.
  String? _titleAndFolder;
  String get titleAndFolder => _titleAndFolder ?? '';
  bool hasTitleAndFolder() => _titleAndFolder != null;

  // "folder_or_folderCollection" field.
  String? _folderOrFolderCollection;
  String get folderOrFolderCollection => _folderOrFolderCollection ?? '';
  bool hasFolderOrFolderCollection() => _folderOrFolderCollection != null;

  // "currentTimeRelative" field.
  DateTime? _currentTimeRelative;
  DateTime? get currentTimeRelative => _currentTimeRelative;
  bool hasCurrentTimeRelative() => _currentTimeRelative != null;

  void _initializeFields() {
    _userForeignKEY = snapshotData['userForeignKEY'] as DocumentReference?;
    _actionType = snapshotData['action_type'] as String?;
    _titleAndFolder = snapshotData['title_and_folder'] as String?;
    _folderOrFolderCollection =
        snapshotData['folder_or_folderCollection'] as String?;
    _currentTimeRelative = snapshotData['currentTimeRelative'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifyActionCollection');

  static Stream<NotifyActionCollectionRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => NotifyActionCollectionRecord.fromSnapshot(s));

  static Future<NotifyActionCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => NotifyActionCollectionRecord.fromSnapshot(s));

  static NotifyActionCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotifyActionCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotifyActionCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotifyActionCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotifyActionCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotifyActionCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotifyActionCollectionRecordData({
  DocumentReference? userForeignKEY,
  String? actionType,
  String? titleAndFolder,
  String? folderOrFolderCollection,
  DateTime? currentTimeRelative,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userForeignKEY': userForeignKEY,
      'action_type': actionType,
      'title_and_folder': titleAndFolder,
      'folder_or_folderCollection': folderOrFolderCollection,
      'currentTimeRelative': currentTimeRelative,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotifyActionCollectionRecordDocumentEquality
    implements Equality<NotifyActionCollectionRecord> {
  const NotifyActionCollectionRecordDocumentEquality();

  @override
  bool equals(
      NotifyActionCollectionRecord? e1, NotifyActionCollectionRecord? e2) {
    return e1?.userForeignKEY == e2?.userForeignKEY &&
        e1?.actionType == e2?.actionType &&
        e1?.titleAndFolder == e2?.titleAndFolder &&
        e1?.folderOrFolderCollection == e2?.folderOrFolderCollection &&
        e1?.currentTimeRelative == e2?.currentTimeRelative;
  }

  @override
  int hash(NotifyActionCollectionRecord? e) => const ListEquality().hash([
        e?.userForeignKEY,
        e?.actionType,
        e?.titleAndFolder,
        e?.folderOrFolderCollection,
        e?.currentTimeRelative
      ]);

  @override
  bool isValidKey(Object? o) => o is NotifyActionCollectionRecord;
}
