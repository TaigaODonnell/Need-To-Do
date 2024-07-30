import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:need_to_do/core/models/task.dart';

class TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addTask(Task task) async {
    try {
      await _firestore.collection('tasks').doc(task.id).set(task.toFirestore());
    } catch (e) {
      print(e);
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>?> getTasks(String userId) async {
    try {
      return await _firestore
          .collection('tasks')
          .where('userId', isEqualTo: userId)
          .get();
    } catch (e) {
      print(e);
    }
    return null;
  }
}
