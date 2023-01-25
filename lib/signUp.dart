import 'package:flutter/material.dart';
import 'package:test_app_supabase/home.dart';
import 'package:test_app_supabase/login.dart';
import 'package:test_app_supabase/resetPassword.dart';
// import 'package:my_app/signUpScreen.dart';
import 'package:test_app_supabase/supabase.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SupabaseManager supabaseManger = SupabaseManager();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign Up Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber,
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
                  controller: _emailController,
                  style: TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      focusColor: Colors.amber,
                      fillColor: Colors.amber,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter  email'),
                  validator: (String? value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Email is not valid';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      focusColor: Colors.amber,
                      fillColor: Colors.amber,
                      filled: true,
                      // border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter  password'),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Invalid password';
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
                      print(_emailController.text);
                      print(_passwordController.text);
                      supabaseManger.signUp(
                        context,
                        _emailController.text,
                        _passwordController.text,
                      );
                    }
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Login()));
                  },
                  child: const Text(
                    ' Login Page',
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                  )),
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
