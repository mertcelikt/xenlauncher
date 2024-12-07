import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../widgets/bottom_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaplanRenkim, // .fromARGB(255, 35, 47, 59),

      body: Center(
        child: Text("Hoşgeldin Paşam, Böyle alalım seni... Bi dakika... Sayfayı daha yapmamışın, yap gel."),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}