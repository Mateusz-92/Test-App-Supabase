import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test_app_supabase/home.dart';

var supabaseUrl = dotenv.env["API_MYURL"] ?? "Api not faund";
var supabaseKey = dotenv.env["API_MYKEY"] ?? '';

var client = SupabaseClient(
  supabaseUrl,
  supabaseKey,
);

class SupabaseManager {
  // var uuid = const Uuid();

  Future<void> signUp(context, String email, String password) async {
    final result = await client.auth.signUp(email: email, password: password);
  }

  Future<void> signInUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    final result =
        await client.auth.signInWithPassword(email: email, password: password);

    // var userId = result.user?.id;

    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
        // settings: RouteSettings(arguments: userId),
      ),
    );
    //}
  }

  Future<void> logout(BuildContext context) async {
    await client.auth.signOut();

    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }

  Future<void> updatePassword(context, String password) async {
    await client.auth.updateUser(UserAttributes(password: password));
  }

  resetPassword(
    var userEmail,
  ) async {
    await client.auth.resetPasswordForEmail(
      userEmail,
      //redirectTo: "io.supabase.reo_beta://reset-password/",
    );
  }

  getCardBox(id) async {
    var response =
        await client.from('card_box').select('*').eq('user_id', id).execute();
    var dataList = response.data as List;
    print(dataList);
    return dataList;
  }
}
