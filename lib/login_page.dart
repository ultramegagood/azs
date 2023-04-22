/// страница для логина

import 'package:azs/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
///
/// страница для логина
///
///
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
///
  ///
  /// метод для проверки и отправки запроса на авторизацию
  ///
  void _submit() async {
    logger.w(_email);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        await auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        context.go('/');
      } on FirebaseAuthException catch (e) {
        showDialog(context: context, builder: (context){
          return AlertDialog(title:Text( "Ошибка"), content: Text(e.code),);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) =>
              value!.isEmpty ? 'Please enter an email' : null,
              onSaved: (value) => _email = value!,
            ),
            SizedBox(height: 25,),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) =>
              value!.isEmpty ? 'Please enter a password' : null,
              onSaved: (value) => _password = value!,
            ),
            SizedBox(height: 25,),

            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
            ),
            SizedBox(height: 25,),

            ElevatedButton(
              onPressed: (){
                context.go("/signup");
              },
              child: Text('Sign UP'),
            ),
          ],
        ),
      ),
    );
  }
}
