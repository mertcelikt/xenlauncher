// ana ekran

import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../core/constants.dart';
import '../widgets/bottom_menu.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaplanRenkim, // .fromARGB(255, 35, 47, 59),
      // AppBar
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 17, 66),
        title: const Text('Q'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.app),
            onPressed: () {},
          ),
        ],
      ),

      // Drawer (Yan Menü)
      drawer: Drawer(
        backgroundColor: arkaplanRenkim,
        elevation: 0,
        child: Column(
          children: [
            // Drawer Header
            SizedBox(
              height: 200,
              // color: Colors.blue,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Colors.black87,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            // Menü öğeleri
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(CupertinoIcons.search),
              title: const Text('History'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text('Profile'),
              onTap: () {
                context.go("/profile");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Ana içerik
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: DotLottieLoader.fromAsset(
                  "assets/motions/q2.lottie",
                  frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),

      // Alt navigasyon çubuğu
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                context.go("/home");
              },
              icon: const Icon(
                CupertinoIcons.home,
              ),
            ),
            IconButton(
              onPressed: () {
                context.go("/search");
              },
              icon: const Icon(
                CupertinoIcons.search,
              ),
            ),
            IconButton(
              onPressed: () {
                context.go("/voice");
              },
              icon: const Icon(
                Icons.android,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.video_camera,
              ),
            ),
            IconButton(
              onPressed: () {
                context.go("/profile");
              },
              icon: const Icon(
                CupertinoIcons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
