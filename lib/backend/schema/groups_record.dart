import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupsRecord extends FirestoreRecord {
  GroupsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "value" field.
  int? _value;
  int get value => _value ?? 0;
  bool hasValue() => _value != null;

  // "limit" field.
  int? _limit;
  int get limit => _limit ?? 0;
  bool hasLimit() => _limit != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "balance_id" field.
  List<String>? _balanceId;
  List<String> get balanceId => _balanceId ?? const [];
  bool hasBalanceId() => _balanceId != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _value = snapshotData['value'] as int?;
    _limit = snapshotData['limit'] as int?;
    _status = snapshotData['status'] as bool?;
    _id = snapshotData['id'] as String?;
    _balanceId = getDataList(snapshotData['balance_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('groups');

  static Stream<GroupsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupsRecord.fromSnapshot(s));

  static Future<GroupsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupsRecord.fromSnapshot(s));

  static GroupsRecord fromSnapshot(DocumentSnapshot snapshot) => GroupsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createGroupsRecordData({
  String? name,
  int? value,
  int? limit,
  bool? status,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'value': value,
      'limit': limit,
      'status': status,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}
