import 'package:cloud_firestore/cloud_firestore.dart';

class Connector {
  late CollectionReference collection;
  Connector(collectionName) {
    collection = FirebaseFirestore.instance.collection(collectionName);
  }

  Future<DocumentSnapshot> getData(id) async {
    return await collection.doc(id).get();
  }

  Future deleteDoc(id) async {
    return await collection.doc(id).delete();
  }

  Future<DocumentReference> addDoc(Map<String, dynamic> data) async {
    return await collection.add(data);
  }

  Future updateDoc(
      {required String id, required Map<String, dynamic> data}) async {
    return await collection.doc(id).update(data);
  }

  Stream<QuerySnapshot> getStreamAll(
      {String orderByColumn = '', required String uid}) {
    if (orderByColumn == '') {
      return collection.where('uid', isEqualTo: uid).snapshots();
    } else {
      return collection
          .where('uid', isEqualTo: uid)
          .orderBy(orderByColumn, descending: false)
          .snapshots();
    }
  }

  Future<List> getAll() async {
    QuerySnapshot query = await collection.get();
    return query.docs;
  }
}
