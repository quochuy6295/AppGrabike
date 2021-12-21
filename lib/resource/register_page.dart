import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grapbike/blocs/auth_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  AuthBloc authBloc = new AuthBloc();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  StreamController _nameController;
  late AuthBloc _authBloc;
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  _onSignUpClicked() {
    var isValid = _authBloc.isValid(_nameController.text, _emailController.text, _passController.text, _phoneController.text);
  }
}
