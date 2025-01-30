import 'package:flutter/material.dart';
import '../widgets/bottom_menu.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geçmiş'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context), //  Filtreleme butonu
          ),
        ],
      ),
      body: Column(
        children: [
          //  Sıralama Seçenekleri
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Sırala:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(width: 8),
                    ChoiceChip(
                      label: Text('En Yeni'),
                      selected: true,
                      onSelected: (_) {},
                    ),
                    SizedBox(width: 8),
                    ChoiceChip(
                      label: Text('Fiyat'),
                      selected: false,
                      onSelected: (_) {},
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Ürün Listesi
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //  2 sütunlu görünüm
                childAspectRatio: 0.75, //  Kart boyutu oranı
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => _buildProductCard(index),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomMenu(), //  Alt navigasyon menüsü
    );
  }

  //  Ürün Kartı Bileşeni
  Widget _buildProductCard(int index) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Ürün Resmi
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 115, 6, 6),
                    image: DecorationImage(
                      image: AssetImage("assets/images/duvarkagıdı.jpg"),
                      

                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Xen Texture Pack..  ${index + 1}',
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  '₺${(index + 1) * 80}', //  Ürün fiyatı
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 8),
                FilledButton.icon(
                  onPressed: () {}, //  Sepete ekleme butonu
                  icon: Icon(Icons.shopping_cart, size: 18),
                  label: Text('Sepete Ekle'),
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 36),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //  Filtreleme Dialog Penceresi
  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Filtrele'),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Fiyat Aralığı
              _buildFilterTitle('Fiyat Aralığı'),
              Row(
                children: [
                  Expanded(
                    child: _buildPriceField('Minimum Fiyat'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildPriceField('Maximum Fiyat'),
                  ),
                ],
              ),

              SizedBox(height: 16),

              //  Kategori Seçimi
              _buildFilterTitle('Kategoriler'),
              Wrap(
                spacing: 8,
                children: [
                  _buildFilterChip('Teknoloji', true),
                  _buildFilterChip('Hayvanlar Alemi', true),
                  _buildFilterChip('Müzik', true),
                  _buildFilterChip('Spor', true),
                ],
              ),

              SizedBox(height: 16),

              // Arama Kutusu
              _buildFilterTitle('Arama'),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Tema Arayın..:)',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Temizle'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Uygula'),
          ),
        ],
      ),
    );
  }

  //  Filtre Başlıkları
  Widget _buildFilterTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  //  Fiyat Aralığı için Input Alanı
  Widget _buildPriceField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixText: '₺',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  //  Filtreleme için Chip Butonları
  Widget _buildFilterChip(String label, bool selected) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) {},
    );
  }
}
