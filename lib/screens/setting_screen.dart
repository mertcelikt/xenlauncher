import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../screens/setting_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool bildirimAcik = true; // Bildirimler için değişken
  String seciliDil = 'TR'; //  Varsayılan dil

  //  Hesap Silme Onay Diyaloğu
  void _hesapSilOnay() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Hesabı Sil"),
        content: Text("Hesabınızı kalıcı olarak silmek istediğinizden emin misiniz?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("İptal"),
          ),
          TextButton(
            onPressed: () {
              // Hesabı silme işlemi burada gerçekleştirilir
              Navigator.pop(context);
            },
            child: Text("Sil", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ayarlar')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //  Tema Değiştirme Ayarı
            Card(
              child: ListTile(
                leading: Icon(Icons.palette, color: Colors.blue),
                title: Text('Tema'),
                trailing: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: Switch(
                    key: ValueKey<bool>(Theme.of(context).brightness == Brightness.dark),
                    value: Theme.of(context).brightness == Brightness.dark,
                    onChanged: (value) {
                      context.read<ThemeProvider>().toggleTheme();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),

            //  Bildirim Ayarı
            Card(
              child: ListTile(
                leading: Icon(Icons.notifications, color: Colors.green),
                title: Text('Bildirimler'),
                trailing: Switch(
                  value: bildirimAcik,
                  onChanged: (value) {
                    setState(() {
                      bildirimAcik = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 8),

            //  Dil Seçimi
            Card(
              child: ListTile(
                leading: Icon(Icons.language, color: Colors.orange),
                title: Text('Dil'),
                trailing: DropdownButton<String>(
                  value: seciliDil,
                  underline: SizedBox(),
                  onChanged: (String? newValue) {
                    setState(() {
                      seciliDil = newValue!;
                    });
                  },
                  items: ['TR', 'EN'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 8),

            //  Uygulama Hakkında
            Card(
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.purple),
                title: Text('Uygulama Hakkında'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Uygulama hakkında sayfasına yönlendirme yapılabilir
                },
              ),
            ),
            SizedBox(height: 8),

            //  Gizlilik Politikası
            Card(
              child: ListTile(
                leading: Icon(Icons.privacy_tip, color: Colors.teal),
                title: Text('Gizlilik Politikası'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Gizlilik politikası sayfasına yönlendirme yapılabilir
                },
              ),
            ),
            SizedBox(height: 8),

            //  Hesabı Silme Butonu
            Card(
              child: ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text(
                  'Hesabı Sil',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: _hesapSilOnay,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeProvider {
  void toggleTheme() {}
}
