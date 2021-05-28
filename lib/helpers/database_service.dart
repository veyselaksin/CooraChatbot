import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chatbot_coora/models/todo.dart';

class DatabaseService {
  CollectionReference todosCollection =
  FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser.uid).collection("Lists");

  Future createNewTodo(String title) async {
    return await todosCollection.add({
      "title": title,
      "isComplete": false,
    });
  }

  Future completTask(uid) async {
    await todosCollection.doc(uid).update({"isComplete": true});
  }
  Future nonCompleteTask(uid) async{
    await todosCollection.doc(uid).update({"isComplete": false});
  }

  Future removeTodo(uid) async {
    await todosCollection.doc(uid).delete();
  }

  List<Todo> todoFromFirestore(QuerySnapshot snapshot) {
    if (snapshot != null) {
      return snapshot.docs.map((e) {
        return Todo(
          isComplete: e.data()["isComplete"],
          title: e.data()["title"],
          uid: e.id,
        );
      }).toList();
    } else {
      return null;
    }
  }

  Stream<List<Todo>> listTodos() {
    return todosCollection.snapshots().map(todoFromFirestore);
  }
}