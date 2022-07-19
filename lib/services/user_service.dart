import 'package:airplane/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _collectionReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUser(String id) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _collectionReference.doc(id).get();
      return UserModel(
        id: documentSnapshot.id,
        email: documentSnapshot['email'],
        name: documentSnapshot['name'],
        hobby: documentSnapshot['hobby'],
        balance: documentSnapshot['balance'],
      );
    } catch (e) {
      throw e;
    }
  }
}
