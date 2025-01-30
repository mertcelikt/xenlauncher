import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'XenLauncher',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 90, 27, 150),
        elevation: 4,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () => context.push("/settings"),
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 65, 3, 63), const Color.fromARGB(255, 73, 3, 58)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAnimationPlaceholder(),
            SizedBox(height: 24),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

 
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color.fromARGB(255, 56, 130, 189), const Color.fromARGB(255, 52, 111, 158)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: const Color.fromARGB(255, 3, 38, 67)),
                ),
                SizedBox(height: 10),
                Text("Hoş Geldiniz!", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          _buildDrawerItem(context, Icons.home, "Ana Sayfa", "/"),
          _buildDrawerItem(context, Icons.search, "Arama", "/search"),
          _buildDrawerItem(context, Icons.person, "Profil", "/profile"),
          _buildDrawerItem(context, Icons.settings, "Ayarlar", "/settings"),
          Spacer(),
          Divider(),
          _buildDrawerItem(context, Icons.logout, "Çıkış Yap", "/login", color: const Color.fromARGB(255, 68, 30, 115)),
        ],
      ),
    );
  }

  
  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, String route, {Color color = const Color.fromARGB(221, 79, 9, 122)}) {
    return ListTile(
      leading: Icon(icon, color: color, size: 28),
      title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      onTap: () => context.push(route),
    );
  }


  Widget _buildAnimationPlaceholder() {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
        ],
      ),
      child: Icon(Icons.play_circle_fill, size: 70, color: Colors.white),
    );
  }

 
  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        _buildActionButton(context, "Sohbet", Icons.chat, "/chat", const Color.fromARGB(255, 83, 3, 91)),
        _buildActionButton(context, "Arama", Icons.search, "/search", const Color.fromARGB(255, 72, 6, 96)),
        _buildActionButton(context, "Ayarlar", Icons.settings, "/settings", const Color.fromARGB(255, 66, 4, 83)),
      ],
    );
  }

  
  Widget _buildActionButton(BuildContext context, String title, IconData icon, String route, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          minimumSize: Size(230, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadowColor: Colors.black38,
          elevation: 5,
        ),
        icon: Icon(icon, size: 26),
        label: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        onPressed: () => context.push(route),
      ),
    );
  }
}
