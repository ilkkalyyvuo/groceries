import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groceries/features/list/domain/item.dart';
import 'package:groceries/features/list/domain/list.dart';

class CollectionPaths {
  static String lists() => 'lists';
  static String items(String listId) => 'lists/$listId/items';
}

class ListsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addList(GroceryList list) {
    return _firestore.collection(CollectionPaths.lists()).add(list.toJson());
  }

  Stream<List<GroceryList>> getListsStream() {
    return _firestore.collection(CollectionPaths.lists()).snapshots().map((
      snapshot,
    ) {
      return snapshot.docs
          .map(
            (doc) => GroceryList.fromJson(doc.data() as Map<String, dynamic>),
          )
          .toList();
    });
  }

  Future<void> addItem(String listId, Item item) {
    return _firestore
        .collection('lists')
        .doc(listId)
        .collection('items')
        .add(item.toJson());
  }

  Stream<List<Item>> getItemsStream(String listId) {
    return _firestore
        .collection('lists')
        .doc(listId)
        .collection('items')
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => Item.fromJson(doc.data() as Map<String, dynamic>))
              .toList();
        });
  }

  Future<void> updateList(String listId, GroceryList list) {
    return _firestore.collection('lists').doc(listId).update(list.toJson());
  }

  Future<void> updateItem(String listId, String itemId, Item item) {
    return _firestore
        .collection('lists')
        .doc(listId)
        .collection('items')
        .doc(itemId)
        .update(item.toJson());
  }

  Future<void> deleteList(String listId) {
    return _firestore.collection('lists').doc(listId).delete();
  }

  Future<void> deleteItem(String listId, String itemId) {
    return _firestore
        .collection('lists')
        .doc(listId)
        .collection('items')
        .doc(itemId)
        .delete();
  }
}
