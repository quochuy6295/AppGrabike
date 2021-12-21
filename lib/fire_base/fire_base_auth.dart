import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirAuth {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // hàm xử lý signUp của firebase, đầu tiên tạo 1 user trong firebase, function được tạo ra nhằm trường hợp tạo nên sự bất đồng bộ
  void signUp(String email, String pass, String name, String phone, Function onSuccess) {
    _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass).then((user) => {
      // user này là của firebaseUser thư viện
      _createUser(user.uid, name, phone, onSuccess),
    }).catchError((err) {

    });
  }

  _createUser(String userId, String name, String phone, Function onSuccess) {
    var user = {"name" = name, "phone": phone};
    var ref = FirebaseDatabase.instance.reference().child("user");
    ref.child(userId).set(user).then((user) => {
      onSuccess(),
    }).catchError((err) {
      // TODO
    });
  }
}