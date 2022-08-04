import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;

Future<DocumentReference> addDataToDB(
    {required String name,
    required String message,
    required String url}) async {
  // ignore: no_leading_underscores_for_local_identifiers
  DocumentReference _doc = await db
      .collection('profilelinktree')
      .doc('person')
      .collection('usersmessages')
      .add({
    "name": name,
    "message": message,
    "url": url,
  });
  // DocumentReference _doc = await _db.collection('something1').doc('2').collection('3').doc('4').collection('fdsa').add({"data": "123212321"});
  return _doc;
}

// returning all the data inside a collection once
Future<QuerySnapshot<Map<String, dynamic>>> getDataOnceUsingFuture() async {
  return await db
      .collection('profilelinktree')
      .doc('person')
      .collection('usersmessages')
      .get();
}
