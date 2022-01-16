import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    bool _loggedIn = user != null;
    return Center(
      child: _loggedIn
          ? Text('Hello, ${user.displayName ?? user.uid}')
          : const Text('Not logged in'),
    );
  }
}
