import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileCollectionRecord extends FirestoreRecord {
  ProfileCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "userForeignKEY" field.
  DocumentReference? _userForeignKEY;
  DocumentReference? get userForeignKEY => _userForeignKEY;
  bool hasUserForeignKEY() => _userForeignKEY != null;

  void _initializeFields() {
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _bio = snapshotData['bio'] as String?;
    _userForeignKEY = snapshotData['userForeignKEY'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profileCollection');

  static Stream<ProfileCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfileCollectionRecord.fromSnapshot(s));

  static Future<ProfileCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ProfileCollectionRecord.fromSnapshot(s));

  static ProfileCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfileCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfileCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfileCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfileCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfileCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfileCollectionRecordData({
  String? firstName,
  String? lastName,
  String? bio,
  DocumentReference? userForeignKEY,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'bio': bio,
      'userForeignKEY': userForeignKEY,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfileCollectionRecordDocumentEquality
    implements Equality<ProfileCollectionRecord> {
  const ProfileCollectionRecordDocumentEquality();

  @override
  bool equals(ProfileCollectionRecord? e1, ProfileCollectionRecord? e2) {
    return e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.bio == e2?.bio &&
        e1?.userForeignKEY == e2?.userForeignKEY;
  }

  @override
  int hash(ProfileCollectionRecord? e) => const ListEquality()
      .hash([e?.firstName, e?.lastName, e?.bio, e?.userForeignKEY]);

  @override
  bool isValidKey(Object? o) => o is ProfileCollectionRecord;
}
