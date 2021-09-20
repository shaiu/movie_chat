import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_chat/service/authentication.dart';
import 'package:provider/provider.dart';

class SignOutPage extends StatelessWidget {
  const SignOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<AuthService>().signOut();
              },
              child: const Text("Sign out"),
            )
          ],
        ),
      ),
    );
  }
}
