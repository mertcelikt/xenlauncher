import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/constants.dart';
import '../core/themes.dart';
import '../widgets/bottom_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        actions: [
          // Karanlık mod / açık mod geçiş butonu
          IconButton(
            icon: Icon(isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profil kartı
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Profil resmi veya baş harfler
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/profile.jpg"), // Eğer bir resim yoksa, baş harfler gösterilecek
                    child: Text(
                      "BU",
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 121, 17, 177)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Kullanıcı bilgileri
                  Text(
                    "Blank User",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "blankuser@blankmail.blan",
                    style: TextStyle(color: const Color.fromARGB(255, 97, 2, 2)),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Ayarlar ve bildirimler bölümü
          Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.settings, color: Color.fromARGB(255, 1, 46, 82)),
                  title: const Text("Ayarlar"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Ayarlar ekranına gitme işlemi
                    context.push('/settings');
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.notifications, color: Color.fromARGB(255, 90, 4, 101)),
                  title: const Text("Bildirimler"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Bildirimler ekranına gitme işlemi
                    context.push('/notifications');
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Çıkış yap butonu
          FilledButton.icon(
            onPressed: () {
              // Çıkış işlemi yapılacak
              context.go('/login'); 
            },
            icon: const Icon(Icons.logout),
            label: const Text("Hesaptan Çıkış Yap"),
            style: FilledButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 111, 3, 61),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Geri dön butonu (eğer önceki sayfa varsa)
          if (context.canPop())
            OutlinedButton.icon(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back),
              label: const Text("Geri Dön"),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(), // Alt menü bileşeni
    );
  }
}

class ThemeProvider {
  void toggleTheme() {}
}
