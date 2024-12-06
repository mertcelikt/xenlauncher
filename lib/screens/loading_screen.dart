//acılış ekranımız buraya gelecek
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005477),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo ve yükleme göstergesi bölümü
          Container(
            width: double.infinity,
            child: Column(
              children: [
                // Logo bölümü
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/images/logo.webp',
                    fit: BoxFit.contain,
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Yükleme ikonu
                const Icon(
                  CupertinoIcons.arrow_2_circlepath,
                  size: 40,
                  color:Color(0xFF780606),
              
                ),
                
                const SizedBox(height: 20),
                
                // Yükleniyor yazısı
                const Text(
                  'Yükleniyor...',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}