import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_demo/pages/create.dart';
import 'package:twitter_demo/pages/settings.dart';
import 'package:twitter_demo/providers/user_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LocalUser currentUser = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: ()=>Scaffold.of(context).openDrawer(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      ref.watch(userProvider)
                          .user.profilePic),
                ),
              ),
            );
          }
        ),
      ),
      body: Column(children: [
        Text(currentUser.user.email),
        Text(currentUser.user.name),
      ],),
      drawer: Drawer(
        child: Column(
          children: [
            Image.network(
                currentUser.user.profilePic,
            ),
            ListTile(
              title: Text(
                "Hello ${currentUser.user.name}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                ),
              ),
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
            ),
            ListTile(
              title: const Text("Sign Out"),
              onTap: () {
                FirebaseAuth.instance.signOut();
                ref.read(userProvider.notifier).logout();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => CreateTweet())));
      },
      child: const Icon(Icons.add),),
    );
  }
}
