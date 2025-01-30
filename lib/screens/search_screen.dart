import 'package:flutter/material.dart';

import '../widgets/bottom_menu.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Üstte kaydırılabilir SliverAppBar
          SliverAppBar(
            floating: true,
            snap: true,
            title: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color:  Color.fromARGB(31, 70, 7, 86),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Arama Yapın...:)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: PopupMenuButton<String>(
                    icon: Icon(Icons.tune),
                    onSelected: (value) {
                      //  Filtreleme işlemleri burada yapılabilir
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(value: "En Yeniler", child: Text("En Yeniler")),
                      PopupMenuItem(value: "En Popüler", child: Text("En Popüler")),
                      PopupMenuItem(value: "En Çok Beğenilen", child: Text("En Çok Beğenilen")),
                      PopupMenuItem(value:"Az Beğenilen", child: Text("Az Beğenilen ")),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Son Aramalar Bölümü
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Son Aramalar",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      ActionChip(
                        label: Text("Free AI"),
                        onPressed: () {},
                        avatar: Icon(Icons.history, size: 16),
                      ),
                      ActionChip(
                        label: Text("BackEnd"),
                        onPressed: () {},
                        avatar: Icon(Icons.history, size: 16),
                      ),
                      ActionChip(
                        label: Text("ChatbotRP"),
                        onPressed: () {},
                        avatar: Icon(Icons.history, size: 16),
                      ),
                      ActionChip(
                        label: Text("Firebase"),
                        onPressed: () {},
                        avatar: Icon(Icons.history, size: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //  Arama Sonuçları Grid Görünümü
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Card(
                  elevation: 4, // Gölgelendirme efekti eklendi
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //  Başlık ve Açıklama Kısmı
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondaryContainer,
                            image: DecorationImage(
                              image: AssetImage('assets/images/duvarkağıdı1.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Müzik Duvar Kağıdı  ${index + 1}",
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Kullanıcılarımızın isteği üzerine yapılan bu duvar kağıdı bize müzik ile teknolojinin iç içe geçmiş halini göstermektedir.  ",
                              style: Theme.of(context).textTheme.bodySmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                childCount: 10, // 10 sonuç gösterilecek
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
