import 'package:appwrite_test/config/notifiers/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  final TextEditingController _userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Appwrite'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: [
            Text("Signup",style: Theme.of(context).textTheme.headline3,),
            const SizedBox(height: 20.0),
            TextField(
              controller: _userName,
              decoration: const InputDecoration(
                  hintText: "name"
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                  hintText: "email"
              ),
            ),
            const SizedBox(height: 10.0),
          TextField(
              controller: _pass,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "password",
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: OutlinedButton(
                child: const Text("Signup"),
                onPressed: (){
                  AuthState auth = Provider.of<AuthState>(context,listen: false);
                  auth.createAccount(_userName.text, _pass.text, _pass.text);

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}