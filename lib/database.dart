import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:fifth/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

//post collection reference
  final CollectionReference postCollection =
      Firestore.instance.collection("Posts");

  //user collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('Users');

  Future updateUserDataNew(
      List<bool> interests, String username, String title) async {
    return await userCollection.document(uid).setData({
      'stockInterest': interests[0],
      'bondInterest': interests[1],
      'forexInterest': interests[2],
      'username': username,
      'title': title,
    });
  }

  Future updateUserData(User user) async {
    user.interestMap.forEach((key, value) {
      userCollection
          .document(uid)
          .collection("interests")
          .document(key)
          .setData({'general': value});
    });

    return await userCollection.document(uid).setData({
      //TODO don't send data if values have not changed!!!
      'username': user.username,
      'title': user.title,
      'email': user.email,
      'subscribe': user.subscribe,
    });
  }

  // Stream<List<Post>> get posts {
  //   return postCollection.snapshots().map(_postListFromSnapshot);
  // }

  Stream<User> get userData {
    //this works! just want interest collection
    return userCollection.document(uid).snapshots().map(userDataFromSnapshot);
  }

  Map<String, bool> _interestData(QuerySnapshot snapshot) {
    //TODO super messy method, clean up
    List<String> keys = ['stocks', 'bonds', 'forex'];
    List<bool> bools = snapshot.documents.map((doc) {
      bool thing = doc.data['general'];
      return thing;
    });
    Map<String, bool> mapStuff = Map.fromIterable(bools,
        key: (item) => item.toString(), value: (item) => item);

    mapStuff.forEach((key, value) {
      print('here is interest key ' + key + ' and value ' + value.toString());
    });
    return mapStuff;
  }

  // Stream<List<Widget>> comments(Post post) {
  //   return Firestore.instance
  //       .collection("Posts")
  //       .document(post.uid)
  //       .collection('comments')
  //       .snapshots()
  //       .map(_commentDataFromSnapshot);
  // }

//Turns data from firebase to comment object
  // List<Comment> _commentDataFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return Comment(
  //       text: doc.data['contents'],
  //     );
  //   }).toList();
  // }

  Future<User> userFromUID(String uid) async {
    DocumentSnapshot snaps = await userCollection.document(uid).get();
    if (snaps.data != null) {
      return userDataFromSnapshot(snaps);
    }
  }

//userData from snapshot of firebase
  User userDataFromSnapshot(DocumentSnapshot snapshot) {
    CollectionReference interests = snapshot.reference.collection('interests');
    print('checking to see if interest map collection is actually there  ' +
        interests.toString());
    //TODO fix the method to get interestmap filled
    //TODO abandon placing interest map in nested collection, just make bool val
    // var stck;
    // interests.document('stock').snapshots().forEach((element) {
    //   stck = element.data['general'];
    // });
    // var bnds;
    // interests.document('bonds').snapshots().forEach((element) {
    //   stck = element.data['general'];
    // });
    // bool frx = interests .document('forex').snapshots().map((doc) => (doc.data['general'] as bool));
    bool frx = false;

    Map<String, bool> interestMap = {
      'stock': true,
      'bonds': false,
      'forex': frx,
    };

    interestMap.forEach((key, value) {
      print('key is ' + key + ' with the value of ' + value.toString());
    });

    return User(
      uid: uid,
      username: snapshot.data['username'],
      email: snapshot.data['email'],
      subscribe: false,
      interestMap: interestMap,
    );
  }

//TIP turns firebase data into post object
  // List<Post> _postListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return Post(
  //         title: doc.data['title'] ?? '',
  //         content: doc.data['content'] ?? '',
  //         stock: doc.data['stock'] ?? '',
  //         uid: doc.data['uid'] ?? '',
  //         authorName: doc.data['authorName'],
  //         subject: doc.data['subject'],
  //         time: doc.data['timeCreated']);
  //   }).toList();
  // }

  // Future addComment(Post post, Comment comment) async {
  //   //print('adding comment to post with uid of ' + uid);
  //   // List<dynamic> array = [comment.text];
  //   return await postCollection
  //       .document(post.uid)
  //       .collection('comments')
  //       .document()
  //       .setData({'contents': comment.text});
  // }

  // Future makeNewPost(Post post) async {
  //   final DocumentReference reference = postCollection.document();

  //   return await reference.setData({
  //     'title': post.title,
  //     'content': post.content,
  //     'subject': post.subject,
  //     'user': post.author.uid,
  //     'uid': reference.documentID,
  //     'authorName': post.author.username,
  //     'timeCreated': FieldValue.serverTimestamp(),
  //   });

  // return await postCollection.document().setData({
  //   'title': post.title,
  //   'content': post.content,
  //   'subject': post.subject,
  //   'user': post.author.uid,
  // });
  // }

//   Future<List> postsForTopic(String name) async {
//     // return await postCollection
//     //     .where('subject', isEqualTo: name)
//     //     .getDocuments();
//     // return postCollection.orderBy('subject').getDocuments();
//     var idk = await postCollection
//         .reference()
//         .where('subject', isEqualTo: name)
//         .getDocuments();

//     List tingz = [];
//     idk.documents.forEach((element) {
//       tingz.add(element.data);
//     });
//     return tingz;
//   }
}
