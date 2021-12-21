import 'dart:async';

import 'package:grapbike/fire_base/fire_base_auth.dart';

class AuthBloc {
  // gọi đến firebase
  var _firAuth = FirAuth ();

  // lấy giá trị các đoạn text truyền trên giao diện
  StreamController _nameController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();
  StreamController _phoneController = new StreamController();

  //getter của stream
  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;
  Stream get phoneController => _phoneController.stream;

  bool isValid(String name, String email, String pass, String phone) {
    // mã lỗi khi đi vào streamController
    if(name == null || name.length == 0) {
      _nameController.sink.addError("Nhập tên");
      return false;
    }
    _nameController.sink.add("");

    if(phone == null || phone.length == 0) {
      _nameController.sink.addError("Nhập số điện thoại");
      return false;
    }
    _phoneController.sink.add("");

    if(email == null || email.length == 0) {
      _emailController.sink.addError("Nhập email");
      return false;
    }
    _emailController.sink.add("");

    if(pass == null || pass.length < 6) {
      _passController.sink.addError("Mật khẩu phải trên 5 ký tự");
      return false;
    }
    _phoneController.sink.add("");

    return true;
  }

  void signUp(String email, String pass, String phone, String name, Function onSuccess) {
    _firAuth.signUp(email, pass, phone, name, onSuccess);
  }

  // đóng stream
  void dispose() {
    _nameController.close();
    _passController.close();
    _emailController.close();
    _phoneController.close();
  }
}