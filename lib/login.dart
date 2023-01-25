import 'package:flutter/material.dart';
import 'package:test_app_supabase/home.dart';
import 'package:test_app_supabase/resetPassword.dart';
import 'package:test_app_supabase/sendResetEmail.dart';
import 'package:test_app_supabase/signUp.dart';
// import 'package:my_app/signUpScreen.dart';
import 'package:test_app_supabase/supabase.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          "Login Page",
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
                      supabaseManger.signInUser(
                        context,
                        _emailController.text,
                        _passwordController.text,
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const sendResetEmail()));
                  },
                  child: const Text(
                    ' Forgot Password',
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const SignUp()));
                    },
                    child: const Text(
                      ' No account',
                      style: TextStyle(color: Colors.amber, fontSize: 18),
                    )),
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
