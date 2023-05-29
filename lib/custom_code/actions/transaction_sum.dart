// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<double> transactionSum(String groupRef) async {
  // Get reference to Firestore collection
  final collectionRef = FirebaseFirestore.instance.collection('transactions');

  // Query transactions associated with the accountId
  final querySnapshot =
      await collectionRef.where('groupRef', isEqualTo: groupRef).get();

  // Calculate the sum of the transaction amounts
  double sum = 2;
  for (var transactionDoc in querySnapshot.docs) {
    final transactionAmount = transactionDoc.data()['sum'] ?? 0;
    sum += transactionAmount;
  }

  // Return the sum
  return sum;
}
