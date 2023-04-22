/// страница регистраций

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

///
/// страница регистраций
///
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        context.go('/');
      } on FirebaseAuthException catch (e) {

        showDialog(context: context, builder: (context){
          return AlertDialog(title:Text( "Ошибка"), content: Text(e.code),);
        });      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUp')),
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
                context.go("/auth");
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
