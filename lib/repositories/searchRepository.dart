import 'package:doggr2/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchRepository {
  final FirebaseFirestore _firestore;

  SearchRepository({FirebaseFirestore firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<User> chooseUser(currentUserId, selectedUserId, name, photoUrl) async {
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('chosenList')
        .doc(selectedUserId)
        .set({});

    await _firestore
        .collection('users')
        .doc(selectedUserId)
        .collection('chosenList')
        .doc(currentUserId)
        .set({});

    await _firestore
        .collection('users')
        .doc(selectedUserId)
        .collection('selectedList')
        .doc(currentUserId)
        .set({
      'name': name,
      'photoUrl': photoUrl,
    });
    return getUser(currentUserId);
  }

  passUser(currentUserId, selectedUserId) async {
    await _firestore
        .collection('users')
        .doc(selectedUserId)
        .collection('chosenList')
        .doc(currentUserId)
        .set({});

    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('chosenList')
        .doc(selectedUserId)
        .set({});
    return getUser(currentUserId);
  }

  Future getUserInterests(userId) async {
    User currentUser = User();

    await _firestore.collection('users').document(userId).get().then((user) {
      currentUser.name = user.get('name');
      currentUser.photo = user.get('photoUrl');
      currentUser.gender = user.get('gender');
      currentUser.interestedIn = user.get('interestedIn');
    });
    return currentUser;
  }

  Future<List> getChosenList(userId) async {
    List<String> chosenList = [];
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('chosenList')
        .get()
        .then((docs) {
      for (var doc in docs.docs) {
        if (docs.docs != null) {
          chosenList.add(doc.id);
        }
      }
    });
    return chosenList;
  }

  Future<User> getUser(userId) async {
    User _user = User();
    List<String> chosenList = await getChosenList(userId);
    User currentUser = await getUserInterests(userId);

    await _firestore.collection('users').get().then((users) {
      for (var user in users.docs) {
        if ((!chosenList.contains(user.id)) &&
            (user.id != userId) &&
            (currentUser.interestedIn == user.get('gender')) &&
            (user.get('interestedIn') == currentUser.gender)) {
          _user.uid = user.id;
          _user.name = user.get('name');
          _user.photo = user.get('photoUrl');
          _user.age = user.get('age');
          _user.location = user.get('location');
          _user.gender = user.get('gender');
          _user.interestedIn = user.get('interestedIn');
          break;
        }
      }
    });

    return _user;
  }
}