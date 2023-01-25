import 'package:flutter/material.dart';
import 'package:test_app_supabase/home.dart';
// import 'package:my_app/signUpScreen.dart';
import 'package:test_app_supabase/supabase.dart';

class sendResetEmail extends StatefulWidget {
  const sendResetEmail({Key? key}) : super(key: key);

  @override
  State<sendResetEmail> createState() => _sendResetEmailState();
}

class _sendResetEmailState extends State<sendResetEmail> {
  final SupabaseManager supabaseManger = SupabaseManager();
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String sended = '';

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "Send email",
          style: TextStyle(color: Colors.black),
        ),
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
                  controller: _email,
                  style: TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      fillColor: Colors.amber,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'email',
                      hintText: 'email'),
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
                  controller: _email,
                  obscureText: true,
                  decoration: const InputDecoration(
                      focusColor: Colors.amber,
                      fillColor: Colors.amber,
                      border: OutlineInputBorder(),
                      labelText: 'Write email',
                      hintText: 'Email'),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    supabaseManger.resetPassword(_email.text);
                    setState(() {
                      sended = "Check your email";
                    });
                  },
                  child: const Text(
                    'SEND',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                sended,
                style: TextStyle(color: Colors.amber, fontSize: 16),
              ),
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
