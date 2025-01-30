// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController epostaYonetici = TextEditingController();
  TextEditingController sifreYonetici = TextEditingController();
  bool sifreGizli = true; // Şifreyi gizlemek veya göstermek için değişken

  // Kullanıcı giriş yapmaya çalıştığında çalışacak fonksiyon
  void girisYap() {
    if (epostaYonetici.text.isEmpty || sifreYonetici.text.isEmpty) {
      _showErrorDialog("Lütfen tüm alanları doldurun.");
    } else if (sifreYonetici.text.length < 8) {
      _showErrorDialog("Şifre en az 8 karakter olmalıdır.");
    } else {
      context.go("/home");
    }
  }

  // Hata mesajlarını göstermek için AlertDialog kullanımı
  void _showErrorDialog(String mesaj) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Hata", style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text(mesaj),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Tamam"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arkaplan 
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade700, Colors.purple.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          //  Login Form Alanı
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //  Başlık
                        Text(
                          "Giriş Yap",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 16),

                        //  E-Posta Alanı
                        TextField(
                          controller: epostaYonetici,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "E-Posta",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.email, color: Colors.blue),
                          ),
                        ),
                        SizedBox(height: 16),

                        // Şifre Alanı
                        TextField(
                          controller: sifreYonetici,
                          obscureText: sifreGizli,
                          decoration: InputDecoration(
                            hintText: "Şifre",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.lock, color: Colors.blue),
                            suffixIcon: IconButton(
                              icon: Icon(
                                sifreGizli
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                setState(() {
                                  sifreGizli = !sifreGizli;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 24),

                        // Giriş Yap Butonu
                        ElevatedButton(
                          onPressed: girisYap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade600,
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child:
                              Text("Giriş Yap", style: TextStyle(fontSize: 16)),
                        ),
                        SizedBox(height: 12),

                        //  Kayıt Ol Butonu
                        TextButton(
                          onPressed: () {
                            context.pushReplacement("/register");
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: Text(
                            "Hesabın yok mu? Kayıt Ol",
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ),
                        SizedBox(height: 16),

                        //  Bölme Çizgisi
                        Row(
                          children: [
                            Expanded(child: Divider(thickness: 1)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text("Veya"),
                            ),
                            Expanded(child: Divider(thickness: 1)),
                          ],
                        ),
                        SizedBox(height: 16),

                        // Google ile Giriş Yap
                        OutlinedButton.icon(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Image.asset('assets/icons/google_icon.png',
                              height: 24),
                          label: Text("Google ile Giriş Yap",
                              style: TextStyle(fontSize: 16)),
                        ),
                        SizedBox(height: 12),

                        //  Apple ile Giriş Yap
                        OutlinedButton.icon(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Image.asset('assets/icons/apple_icon.png',
                              height: 24),
                          label: Text("Apple ID ile Giriş Yap",
                              style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
