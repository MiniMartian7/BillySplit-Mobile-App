import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BalanceRecord extends FirestoreRecord {
  BalanceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "credit" field.
  double? _credit;
  double get credit => _credit ?? 0.0;
  bool hasCredit() => _credit != null;

  // "debt" field.
  double? _debt;
  double get debt => _debt ?? 0.0;
  bool hasDebt() => _debt != null;

  // "transaction_id" field.
  String? _transactionId;
  String get transactionId => _transactionId ?? '';
  bool hasTransactionId() => _transactionId != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _credit = castToType<double>(snapshotData['credit']);
    _debt = castToType<double>(snapshotData['debt']);
    _transactionId = snapshotData['transaction_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('balance');

  static Stream<BalanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BalanceRecord.fromSnapshot(s));

  static Future<BalanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BalanceRecord.fromSnapshot(s));

  static BalanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BalanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BalanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BalanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BalanceRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createBalanceRecordData({
  String? id,
  String? userId,
  double? credit,
  double? debt,
  String? transactionId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'user_id': userId,
      'credit': credit,
      'debt': debt,
      'transaction_id': transactionId,
    }.withoutNulls,
  );

  return firestoreData;
}
