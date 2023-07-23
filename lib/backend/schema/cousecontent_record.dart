import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CousecontentRecord extends FirestoreRecord {
  CousecontentRecord._(
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

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "sku" field.
  String? _sku;
  String get sku => _sku ?? '';
  bool hasSku() => _sku != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "translated" field.
  TranslateStruct? _translated;
  TranslateStruct get translated => _translated ?? TranslateStruct();
  bool hasTranslated() => _translated != null;

  // "translated2" field.
  TranslateStruct? _translated2;
  TranslateStruct get translated2 => _translated2 ?? TranslateStruct();
  bool hasTranslated2() => _translated2 != null;

  // "title_manual_translated" field.
  TranslateStruct? _titleManualTranslated;
  TranslateStruct get titleManualTranslated =>
      _titleManualTranslated ?? TranslateStruct();
  bool hasTitleManualTranslated() => _titleManualTranslated != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _sku = snapshotData['sku'] as String?;
    _tags = getDataList(snapshotData['tags']);
    _translated = TranslateStruct.maybeFromMap(snapshotData['translated']);
    _translated2 = TranslateStruct.maybeFromMap(snapshotData['translated2']);
    _titleManualTranslated =
        TranslateStruct.maybeFromMap(snapshotData['title_manual_translated']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cousecontent');

  static Stream<CousecontentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CousecontentRecord.fromSnapshot(s));

  static Future<CousecontentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CousecontentRecord.fromSnapshot(s));

  static CousecontentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CousecontentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CousecontentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CousecontentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CousecontentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CousecontentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCousecontentRecordData({
  String? title,
  String? description,
  String? imageUrl,
  double? price,
  String? sku,
  TranslateStruct? translated,
  TranslateStruct? translated2,
  TranslateStruct? titleManualTranslated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'sku': sku,
      'translated': TranslateStruct().toMap(),
      'translated2': TranslateStruct().toMap(),
      'title_manual_translated': TranslateStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "translated" field.
  addTranslateStructData(firestoreData, translated, 'translated');

  // Handle nested data for "translated2" field.
  addTranslateStructData(firestoreData, translated2, 'translated2');

  // Handle nested data for "title_manual_translated" field.
  addTranslateStructData(
      firestoreData, titleManualTranslated, 'title_manual_translated');

  return firestoreData;
}

class CousecontentRecordDocumentEquality
    implements Equality<CousecontentRecord> {
  const CousecontentRecordDocumentEquality();

  @override
  bool equals(CousecontentRecord? e1, CousecontentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.price == e2?.price &&
        e1?.sku == e2?.sku &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.translated == e2?.translated &&
        e1?.translated2 == e2?.translated2 &&
        e1?.titleManualTranslated == e2?.titleManualTranslated;
  }

  @override
  int hash(CousecontentRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.imageUrl,
        e?.price,
        e?.sku,
        e?.tags,
        e?.translated,
        e?.translated2,
        e?.titleManualTranslated
      ]);

  @override
  bool isValidKey(Object? o) => o is CousecontentRecord;
}
