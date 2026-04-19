import 'package:cloud_firestore/cloud_firestore.dart';
import '../../app/home/models/day_model.dart';
import '../../app/home/models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Collection References
  CollectionReference get _usersRef => _db.collection('users');

  Future<void> syncUser(UserModel user) async {
    try {
      await _usersRef.doc(user.id).set(user.toJson(), SetOptions(merge: true));
    } catch (e) {
      print("Firestore Sync Error (User): $e");
    }
  }

  Future<void> syncDay(String userId, DayModel day) async {
    try {
      await _usersRef
          .doc(userId)
          .collection('history')
          .doc(day.id)
          .set(day.toJson(), SetOptions(merge: true));
    } catch (e) {
      print("Firestore Sync Error (Day): $e");
    }
  }

  Future<UserModel?> fetchUser(String userId) async {
    try {
      final doc = await _usersRef.doc(userId).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print("Firestore Fetch Error (User): $e");
    }
    return null;
  }
}
