import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
this database stores posts written by user in the app

this contians
-a message
-email of messager
-timestamp

*/

class FirestoreDatabase {
  //current logged in user
  final User? user = FirebaseAuth.instance.currentUser;

  //get collection of posts
  final CollectionReference posts = 
  FirebaseFirestore.instance.collection('Posts');
  //post a message

  Future<void> addPost(String message) {
    return posts.add({
      'UserEmail': user!.email,
      'PostMessage': message,
      'TimeStamp': Timestamp.now(),
    });
  }

  //read the posts from collections
  Stream<QuerySnapshot> getPostsStream() {
    final postsStream = FirebaseFirestore.instance
    .collection('Posts')
    .orderBy('TimeStamp', descending: true)
    .snapshots();
  
  return postsStream;

  }

}