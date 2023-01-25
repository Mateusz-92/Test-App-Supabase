import 'package:flutter/material.dart';
import 'package:test_app_supabase/supabase.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SupabaseManager supabaseManger = SupabaseManager();
  var user = client.auth.currentUser?.id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          child: Center(
            child: Text(
              'Data from supabase',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          height: 70,
          color: Colors.amber,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
        ),
      ),
      backgroundColor: const Color(0xFF000000),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: supabaseManger.getCardBox(user),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) return Text('');

                return ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length ?? 0,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              snapshot.data[index]['name'],
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 20),
                            ),
                          ),
                        ],
                      );
                    });
              }),
        ),
      ),
    );
  }
}
