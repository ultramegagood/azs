import 'package:azs/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) =>
              value!.isEmpty ? 'Please enter an email' : null,
              onSaved: (value) => _email = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) =>
              value!.isEmpty ? 'Please enter a password' : null,
              onSaved: (value) => _password = value!,
            ),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
            ),
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
