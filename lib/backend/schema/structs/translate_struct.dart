// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TranslateStruct extends FFFirebaseStruct {
  TranslateStruct({
    String? ar,
    String? en,
    String? kn,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ar = ar,
        _en = en,
        _kn = kn,
        super(firestoreUtilData);

  // "ar" field.
  String? _ar;
  String get ar => _ar ?? '';
  set ar(String? val) => _ar = val;
  bool hasAr() => _ar != null;

  // "en" field.
  String? _en;
  String get en => _en ?? '';
  set en(String? val) => _en = val;
  bool hasEn() => _en != null;

  // "kn" field.
  String? _kn;
  String get kn => _kn ?? '';
  set kn(String? val) => _kn = val;
  bool hasKn() => _kn != null;

  static TranslateStruct fromMap(Map<String, dynamic> data) => TranslateStruct(
        ar: data['ar'] as String?,
        en: data['en'] as String?,
        kn: data['kn'] as String?,
      );

  static TranslateStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TranslateStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'ar': _ar,
        'en': _en,
        'kn': _kn,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ar': serializeParam(
          _ar,
          ParamType.String,
        ),
        'en': serializeParam(
          _en,
          ParamType.String,
        ),
        'kn': serializeParam(
          _kn,
          ParamType.String,
        ),
      }.withoutNulls;

  static TranslateStruct fromSerializableMap(Map<String, dynamic> data) =>
      TranslateStruct(
        ar: deserializeParam(
          data['ar'],
          ParamType.String,
          false,
        ),
        en: deserializeParam(
          data['en'],
          ParamType.String,
          false,
        ),
        kn: deserializeParam(
          data['kn'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TranslateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TranslateStruct &&
        ar == other.ar &&
        en == other.en &&
        kn == other.kn;
  }

  @override
  int get hashCode => const ListEquality().hash([ar, en, kn]);
}

TranslateStruct createTranslateStruct({
  String? ar,
  String? en,
  String? kn,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TranslateStruct(
      ar: ar,
      en: en,
      kn: kn,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TranslateStruct? updateTranslateStruct(
  TranslateStruct? translate, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    translate
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTranslateStructData(
  Map<String, dynamic> firestoreData,
  TranslateStruct? translate,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (translate == null) {
    return;
  }
  if (translate.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && translate.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final translateData = getTranslateFirestoreData(translate, forFieldValue);
  final nestedData = translateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = translate.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTranslateFirestoreData(
  TranslateStruct? translate, [
  bool forFieldValue = false,
]) {
  if (translate == null) {
    return {};
  }
  final firestoreData = mapToFirestore(translate.toMap());

  // Add any Firestore field values
  translate.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTranslateListFirestoreData(
  List<TranslateStruct>? translates,
) =>
    translates?.map((e) => getTranslateFirestoreData(e, true)).toList() ?? [];
