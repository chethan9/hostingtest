import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SessionsRecord extends FirestoreRecord {
  SessionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "uniqueId" field.
  String? _uniqueId;
  String get uniqueId => _uniqueId ?? '';
  bool hasUniqueId() => _uniqueId != null;

  // "loginDateTime" field.
  DateTime? _loginDateTime;
  DateTime? get loginDateTime => _loginDateTime;
  bool hasLoginDateTime() => _loginDateTime != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  void _initializeFields() {
    _userEmail = snapshotData['userEmail'] as String?;
    _uniqueId = snapshotData['uniqueId'] as String?;
    _loginDateTime = snapshotData['loginDateTime'] as DateTime?;
    _isActive = snapshotData['isActive'] as bool?;
    _userref = snapshotData['userref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sessions');

  static Stream<SessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SessionsRecord.fromSnapshot(s));

  static Future<SessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SessionsRecord.fromSnapshot(s));

  static SessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSessionsRecordData({
  String? userEmail,
  String? uniqueId,
  DateTime? loginDateTime,
  bool? isActive,
  DocumentReference? userref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userEmail': userEmail,
      'uniqueId': uniqueId,
      'loginDateTime': loginDateTime,
      'isActive': isActive,
      'userref': userref,
    }.withoutNulls,
  );

  return firestoreData;
}

class SessionsRecordDocumentEquality implements Equality<SessionsRecord> {
  const SessionsRecordDocumentEquality();

  @override
  bool equals(SessionsRecord? e1, SessionsRecord? e2) {
    return e1?.userEmail == e2?.userEmail &&
        e1?.uniqueId == e2?.uniqueId &&
        e1?.loginDateTime == e2?.loginDateTime &&
        e1?.isActive == e2?.isActive &&
        e1?.userref == e2?.userref;
  }

  @override
  int hash(SessionsRecord? e) => const ListEquality().hash(
      [e?.userEmail, e?.uniqueId, e?.loginDateTime, e?.isActive, e?.userref]);

  @override
  bool isValidKey(Object? o) => o is SessionsRecord;
}
