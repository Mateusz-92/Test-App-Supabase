import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_app_supabase/home.dart';
import 'package:test_app_supabase/login.dart';
import 'package:test_app_supabase/sendResetEmail.dart';

// void main() {
//   runApp(const MyApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//flutter run --no-sound-null-safety
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/reset-password': (_) => const sendResetEmail(),
        },
        title: 'Test Supabase',
        theme: ThemeData(
          backgroundColor: Colors.black,
        ),
        home: const Login());
  }
}
