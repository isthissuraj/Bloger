import 'package:blog_app/features/auth/presentation/pages/login_page.dart';
import 'package:blog_app/features/blog/presentation/pages/add_new_blog_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BogER',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: IconButton(
              iconSize: 50,
              onPressed: () {
                Navigator.push(context, AddNewBlogPage.route());
              },
              icon: const Icon(
                CupertinoIcons.add_circled,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Call Supabase logout function
              Supabase.instance.client.auth.signOut();
              // Navigate to the login screen after logout
              Navigator.push(context,
                  LoginPage.route()); // Assuming '/' is your login screen route
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
