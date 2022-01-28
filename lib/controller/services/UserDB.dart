import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class UserDB {
  //Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
  //           return Text("Full Name: ${data['full_name']} ${data['last_name']}");
  Future<Object> recoveryUserDocument(String userUid) async {
    Map<String, dynamic> data = {};
    try {
      CollectionReference document =
          FirebaseFirestore.instance.collection('user');
      return await document.doc(userUid).get();
      // document.doc(userUid).get().then((value){
      //   //return value;
      //   data = value.data() as Map<String, dynamic>;
      //   print(">>>>>>>>>> UserDB");
      //   //print(data);
      //   return data;
      // });
    } catch (e) {
      print("Failed fetch user data.");
    }
    return data;
  }
}
