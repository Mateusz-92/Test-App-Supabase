import 'package:flutter/material.dart';
import 'package:test_app_supabase/home.dart';
// import 'package:my_app/signUpScreen.dart';
import 'package:test_app_supabase/supabase.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final SupabaseManager supabaseManger = SupabaseManager();
  final _password = TextEditingController();
  final _checkPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _password.dispose();
    _checkPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text("Change Password",
            style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _password,
                  style: TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      fillColor: Colors.amber,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Password'),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Invalid password';
                    }
                    if (value.length < 6) {
                      return 'Password must have min 6 letters';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _checkPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                      fillColor: Colors.amber,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Repeat password',
                      hintText: 'Repeat password'),
                  validator: (String? value) {
                    if (_password.value != _checkPassword.value) {
                      return 'passwords are not the same';
                    }
                    if (value!.isEmpty) {
                      return 'Invalid password';
                    }
                    if (value.length < 6) {
                      return 'Password must have min 6 letters';
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70),
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      supabaseManger.updatePassword(
                          context, _checkPassword.text);
                    }
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              // TextButton(
              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (_) => const Home()));
              //     },
              //     child: const Text(
              //       ' Create New Account',
              //       style: TextStyle(color: Colors.white, fontSize: 25),
              //     )),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
